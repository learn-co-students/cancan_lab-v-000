Rails.application.routes.draw do
  
  root 'notes#index'

  resources :users, :only => [:create]
  resources :notes



end
