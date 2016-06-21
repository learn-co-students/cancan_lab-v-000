
Rails.application.routes.draw do
  get 'users/create'

  get 'welcome/home'

  get 'users/create'

  resources :notes
  root 'welcome#home'
end
