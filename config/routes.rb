Rails.application.routes.draw do
  root to: "notes#index"
  resources :notes
  resources :users
  resources :viewers
end
