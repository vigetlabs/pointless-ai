Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  put "/home/prompt", to: "home#prompt", as: 'prompt'  
  get "/home", to: "home#index"  


  # Defines the root path route ("/")
  root "home#index"
end
