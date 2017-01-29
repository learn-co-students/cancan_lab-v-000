Rails.application.routes.draw do
  resources :notes
  get 'notes/:id/edit' => 'notes#edit'

  root 'notes#index'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
