class ApplicationController < ActionController::Base
  protect_from_forgery
  
protected
  def find_available_objects
    begin
      @available_objects = AnypresenceExtensionWrapper::Wrapper.new(current_account.id).object_definition_mappings

      if @available_objects.nil?
        flash[:alert] = "Unable to find any available objects. Please create objects for application #{application_name}."
        redirect_to settings_path
      end
    rescue
      flash[:alert] = "Unable to retrieve object names for building a menu."
      redirect_to settings_path
    end
  end
end