Rails.application.routes.draw do

  resources :outages

  mount EmailExtension::Engine => "/email_extension"
end
