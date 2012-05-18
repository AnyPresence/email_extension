EmailExtension::Engine.routes.draw do
  match 'settings' => 'settings#settings'

  root :to => 'texter#unauthorized'
end
