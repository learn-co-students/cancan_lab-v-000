Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :notes
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  root 'notes#index'
end
