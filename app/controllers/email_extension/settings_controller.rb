module EmailExtension
  class SettingsController < AnypresenceExtension::SettingsController
    layout 'application'
  
    before_filter :find_api_version, :only => [:provision, :perform, :publish]
    before_filter :find_object_definition_name, :only => [:perform]
    before_filter :authenticate_account!, :except => [:consume]

    def settings
      if request.put?
        if current_account.update_attributes params[:account], :without_protection => true
          flash[:notice] = "Account updated."
          redirect_to settings_path
        else
          flash[:alert] = "Account could not be updated."

          render :action => "settings", :controller => "settings"
        end
      end
    end

    def get_fields
      fields = current_account.get_fields
    
      respond_to do |format|
        format.json { render :json => fields }
      end
    end
  
    # Perform lifecycle triggered action by sending the email.
    def perform
      email_option = current_account.email_options.where(:name => @object_definition_name.downcase).first
      formatted_body  = AnypresenceExtension::Common::LiquidTemplate::parse_format_string(email_option.body, @object_definition_name, params).to_s
      formatted_body << "\n\n"
      formatted_to_address  = AnypresenceExtension::Common::LiquidTemplate::parse_format_string(email_option.to_address, @object_definition_name, params).to_s
      formatted_subject  = AnypresenceExtension::Common::LiquidTemplate::parse_format_string(email_option.subject, @object_definition_name, params).to_s
    
      begin
        Notifier.send_email(current_account.email_from, formatted_to_address, formatted_subject, formatted_body).deliver
        render :json => { :success => true }
      rescue
        render :json => { :success => false }
      end
    end
  
    # Consumes incoming email.
    def consume
      to_field = params[:to]
      from_field = params[:from]
      subject_field = params[:subject]
      body_field = params[:html].nil? ? params[:text] : params[:html]
    
      # Application id should be the user in the email address.
      application_id = to_field.split("@")[0];
      application_id = application_id.strip.gsub('"', '')
    
      account = AnypresenceExtension::Account.where(:application_id => application_id).first
    
      if account.blank?
        Rails.logger.info "Unable to find a corresponding account for application id, #{application_id}"
        render :json => { :success => false }
      else
        # Find what object definition name should be used from the subject line
        object_definition_name = account.find_object_name(subject_field)
        consume_email_option = account.consume_email_options.where(:name => object_definition_name.downcase).first
        # Create an object instance where the object definition and field are determined by +consume_email_option+.
        # The field will be filled with +body_field+
        account.create_object_instance(consume_email_option, body_field)
        render :json => { :success => true }
      end
    end
  
  end
end