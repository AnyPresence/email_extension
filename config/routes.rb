EmailExtension::Engine.routes.draw do
  match 'settings' => 'settings#settings'

  root :to => "settings#index"
end
