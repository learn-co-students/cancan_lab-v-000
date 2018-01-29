Rails.application.routes.draw do
  root 'notes#index'
  resources :notes
  resources :users, only: [:create]
  resources :sessions, only: [:create, :destroy]
end
