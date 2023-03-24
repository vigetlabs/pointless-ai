Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }

  root "home#index"

  post "messages/create", to: "messages#create"
  post "messages/reset", to: "messages#reset"
end
