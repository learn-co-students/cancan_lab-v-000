Rails.application.routes.draw do
  resources :notes, :sessions
  resources :user, only: [:create]
end
