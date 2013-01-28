EmailExtension::Engine.routes.draw do
  match 'settings' => 'settings#settings'
  get 'email' => 'messages#email'
  
  root :to => "settings#index"
end
