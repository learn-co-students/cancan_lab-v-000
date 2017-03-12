Rails.application.routes.draw do
    root 'notes#index'
    resources :users, only: [:create]
    resources :notes
    post 'create' => 'notes#create'
    post 'update' => 'notes#update'
end
