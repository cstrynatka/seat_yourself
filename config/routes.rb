Rails.application.routes.draw do
	#root
  	get 'sessions/new'
  	#get 'help'
  	#get 'about'
  	# get 'contact'
  	# get 'signup'
  	# get 'login'
  	# post 'login'
  	# delete 'logout'

  resources :reservations 
  resources :users, only: [:new, :edit, :show, :destroy, :create]
  resources :restaurants, only: [:new, :edit, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
end
