Rails.application.routes.draw do
  get 'user/create'
  resources :notes
  root 'notes#index'
end
