class SettingsController < AnypresenceExtension::SettingsController
  layout 'application'
  
  before_filter :find_api_version, :only => [:provision, :perform, :publish]
  before_filter :find_object_definition_name, :only => [:perform]

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
    formatted_to_address  = AnypresenceExtension::Common::LiquidTemplate::parse_format_string(email_option.to_address, @object_definition_name, params).to_s
    formatted_subject  = AnypresenceExtension::Common::LiquidTemplate::parse_format_string(email_option.subject, @object_definition_name, params).to_s
  
    Notifier.send_email(current_account.email_from, formatted_to_address, formatted_subject, formatted_body).deliver
    render :json => { :success => true }
  end
end
