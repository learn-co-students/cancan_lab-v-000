Rails.application.routes.draw do

  root 'notes#index'
  
  resources :notes

  get 'notes/:id/edit' => 'notes#edit'

  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

end
