Rails.application.routes.draw do
  resources :notes
  resources :sessions

  get '/' => "notes#index"
end
