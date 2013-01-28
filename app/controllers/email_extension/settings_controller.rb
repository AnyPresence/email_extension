require_dependency "email_extension/application_controller"
module EmailExtension
  class SettingsController < ApplicationController
    before_filter :authenticate_admin!
  
    def index
      @messages = ::EmailExtension::Message.all.page(params[:page])
    end
    
  end
end