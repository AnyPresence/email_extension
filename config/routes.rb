require 'anypresence_extension/lc_routes'

EmailExtension::Application.routes.draw do
  match "settings" => "settings#settings"
  match "get-fields" => "settings#get_fields"
  anypresence_extension_lifecycle_triggered_action "settings#perform"
  
  resources :accounts do
    resources :email_options
  end
  
  mount AnypresenceExtension::Engine => "/"
end
