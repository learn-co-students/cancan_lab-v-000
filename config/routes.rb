Rails.application.routes.draw do
  # , :index, :show, :update
  resources :notes, only: [:create, :update]
  root 'static_pages#home'
end
