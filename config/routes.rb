Rails.application.routes.draw do
  resources :tasks
  resources :days
  resources :users
  post "/register", to: "auth#register"
  post "/login", to: "auth#login"
  patch "/edit_profile", to: "users#edit_profile"
  get "/profile", to: "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
