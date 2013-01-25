Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do  
      resources :outages
    end
    mount EmailExtension::Engine => "/email_extension"
  end
end
