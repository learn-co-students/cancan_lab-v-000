Rails.application.routes.draw do
  root 'notes#index'
  resources :notes
  get '/login', to: 'sessions#new', as: "login"
  resources :sessions, only: [:create]
  get '/logout', to: 'sessions#delete', as: "logout"
end
