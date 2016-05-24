Rails.application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  resources :notes
  resources :users, only: [:create]
  root 'notes#index'
  get 'users/create'
end
