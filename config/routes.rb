Rails.application.routes.draw do

    
    resources :notes
    root 'notes#index'

	get '/login' => 'sessions#new'    
  	post '/login' => 'sessions#create'
  	post '/logout' => 'sessions#destroy'

    get 'users/new'
    resources :users
    

  	get 'welcome/home'

  	
  	
end

