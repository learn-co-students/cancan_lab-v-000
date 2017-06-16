Rails.application.routes.draw do
  root 'notes#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#post'
  post '/logout', to: 'sessions#destroy'
  resources :users, only: [:create]
  resources :notes
end
