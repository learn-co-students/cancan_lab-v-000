Rails.application.routes.draw do

  resources :notes
  resources :users, only: [:create]

  get 'sessions/sign_up', to: 'sessions#sign_up'
  get 'sessions/sign_in', to: 'sessions#sign_in'
  get 'sessions/sign_out', to: 'sessions#sign_out'


end
