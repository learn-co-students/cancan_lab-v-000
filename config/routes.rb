Rails.application.routes.draw do
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  post 'signup', to: 'users#create'
  resources :notes
  root 'notes#index'
end
