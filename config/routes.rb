Rails.application.routes.draw do
  root 'sessions#new'

  resources :notes
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:create]
end
