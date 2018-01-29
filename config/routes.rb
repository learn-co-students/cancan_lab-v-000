Rails.application.routes.draw do
 resources :users, only:[:create]
 resources :notes
 resources :sessions, only:[:new, :create, :destroy]
end
