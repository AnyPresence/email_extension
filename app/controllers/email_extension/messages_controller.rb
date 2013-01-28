require_dependency "email_extension/application_controller"

module EmailExtension
  class MessagesController < ApplicationController
    before_filter :authenticate_admin!
    
    def new
      @message = ::EmailExtension::Message.new
    end
    
    def create
      message = ::EmailExtension::Message.new(params[:message])
      status = false
      begin
        ::EmailExtension::Notifier.send_email(nil, nil, message.from, message.to, message.subject, message.body).deliver
        status = true
      rescue
        Rails.logger.error "Unable to send out email: #{$!.message}"
      end
      
      respond_to do |format|
        if status
          format.html { redirect_to settings_path }
        else
          format.html { render action: "new" }
        end
      end
    end
    
  end
end
