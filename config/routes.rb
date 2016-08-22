Rails.application.routes.draw do
  resources :notes
  resources :sessions
  resources :users
  get '/' => "notes#index"
end
