Rails.application.routes.draw do
  root 'notes#index'

  resources :notes

  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
end
