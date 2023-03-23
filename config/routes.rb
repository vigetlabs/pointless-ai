Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  post "messages/create", to: "messages#create"
  post "messages/reset", to: "messages#reset"
end
