EmailExtension::Engine.routes.draw do
  match 'settings' => 'settings#index'
  get 'email' => 'messages#email'
  
  resources :messages
  
  root :to => "settings#index"
end
