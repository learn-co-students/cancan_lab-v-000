Rails.application.routes.draw do

  resources :notes
  resources :users, only: [:create]
  resources :sessions, only: [:create, :destroy]

end
