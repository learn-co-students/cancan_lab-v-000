Rails.application.routes.draw do

  resources :notes
  get 'signup' => 'sessions#signup'
  post 'users' => 'users#create'
  get 'logout' => 'sessions#logout'
  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'
  root 'notes#index'
end
