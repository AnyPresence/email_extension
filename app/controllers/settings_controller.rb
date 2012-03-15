class SettingsController < AnypresenceExtension::SettingsController
  layout 'application'
  
  before_filter :find_api_version, :only => [:provision, :perform, :publish]
  before_filter :find_object_definition_name, :only => [:perform]

  # Perform lifecycle triggered action.
  def perform
  end
end
