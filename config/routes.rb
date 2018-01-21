Rails.application.routes.draw do

  root 'notes#index'
  
  resources :notes
  resources :users, only: :create

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

end