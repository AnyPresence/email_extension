Rails.application.routes.draw do

  mount EmailExtension::Engine => "/email_extension"
end
