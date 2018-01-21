Rails.application.routes.draw do

  resources :users
  resources :sessions
  resources :notes

  root to: 'users#new'
end
