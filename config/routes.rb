Rails.application.routes.draw do
  get "/", to: "places#index"
  
  resources :entries
  resources :places
  resources :users, only: [:new, :create]

  # Routes for login/logout
  resource :session, only: [:new, :create, :destroy]

  # Friendly login/logout routes
  get "/login", to: "sessions#new"
  post "/session", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end