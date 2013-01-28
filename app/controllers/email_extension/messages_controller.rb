require_dependency "email_extension/application_controller"

module EmailExtension
  class MessagesController < ApplicationController
    
    def email
      @message = ::EmailExtension::Message.new
    end
    
    def create
      message = ::EmailExtension::Message.new(params[:message])
      ::EmailExtension::Notifier.send_email(nil, nil, message.from, message.to, message.subject, message.body).deliver
      
      respond_to do |format|
        format.html { redirect_to settings_path }
      end
    end
    
  end
end
