Rails.application.routes.draw do
    root 'notes#index'
    resources :users, only: [:create]
    resources :notes
    get 'create' => 'sessions#create'
    post 'create' => 'notes#create'
end
