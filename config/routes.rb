Rails.application.routes.draw do
  resources :notes
  resources :users, only: [:create]

  root 'notes#index'
end
