Rails.application.routes.draw do
  root 'welcome#home'
  resources :notes
  post '/users' => 'users#create'
  get '/users/new' => 'users#new'
  get '/users/login' => 'users#login'
  post '/sessions' => 'sessions#create'
  post  '/sessions/new' => 'sessions#new'
end
