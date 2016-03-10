Rails.application.routes.draw do

  root to: 'notes#index'

  resources :notes

  resources :users, only: [:create]

  resources :sessions, only: [:create]

end
