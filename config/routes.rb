Rails.application.routes.draw do
  root 'welcome#home'
  resources :notes
  post '/users' => 'users#create'
  get '/users/new' => 'users#new'
  post '/sessions' => 'sessions#create'
  get  '/sessions/new' => 'sessions#new'
end
