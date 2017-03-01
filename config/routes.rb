Rails.application.routes.draw do
  root 'notes#index'

  resources :users, only: [:create]
  resources :notes

  post '/login' => 'sessions#create'
  post '/logout' => 'sessios#destroy'
end
