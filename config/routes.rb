Rails.application.routes.draw do
  root "users#welcome"

  resources :notes
  resources :users, only: [:create, :new]

  resources :sessions, only: [:new, :create]

  delete "/logout", to: "sessions#destroy"
end
