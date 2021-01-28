Rails.application.routes.draw do
  resources :days
  resources :users
  post "/register", to: "auth#register"
  post "/login", to: "auth#login"
  patch "/edit_profile", to: "users#edit_profile"
  get "/profile", to: "users#show"
  patch "/tasks/:id", to: "tasks#edit_task"
  delete "/tasks/:id", to: "tasks#destroy"
  post "/tasks/", to: "tasks#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
