Rails.application.routes.draw do
  resources :notes
  resources :sessions
  root 'notes#index'

  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

end
