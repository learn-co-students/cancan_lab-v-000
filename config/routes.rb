Rails.application.routes.draw do
  root 'notes#home'

resources :users, only: [:create]
resources :notes
get '/login' => 'sessions#login'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'
end
