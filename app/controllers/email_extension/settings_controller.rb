require_dependency "email_extension/application_controller"
module EmailExtension
  class SettingsController < ApplicationController
    before_filter :authenticate_admin!
  
  end
end