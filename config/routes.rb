Rails.application.routes.draw do

  resources :users
  resources :notes
  root "notes#index"


  post 'login' => "sessions#create"
  post 'logout' => "sessions#destroy"
end
