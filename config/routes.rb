require 'anypresence_extension/lc_routes'

EmailExtension::Application.routes.draw do
  match "settings" => "settings#settings"
  anypresence_extension_lifecycle_triggered_action "settings#perform"

  mount AnypresenceExtension::Engine => "/"
end
