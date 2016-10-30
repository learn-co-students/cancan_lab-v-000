Rails.application.routes.draw do
  resources :notes
  get 'notes/:id/edit' => 'notes#edit'
  
  root 'notes#index'

  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
