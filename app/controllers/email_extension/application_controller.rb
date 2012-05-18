class ApplicationController < ActionController::Base
  protect_from_forgery
  
protected
  def find_available_objects
    unless current_account.nil?
      begin
        @available_objects = current_account.object_definition_mappings

        if @available_objects.nil?
          flash[:alert] = "Unable to find any available objects. Please create objects for application #{application_name}."
          redirect_to settings_path
        end
      rescue
        flash[:alert] = "Unable to retrieve object names for building a menu. Please publish the application."
        redirect_to settings_path
      end
    end
  end
end
