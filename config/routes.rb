Rails.application.routes.draw do
  get 'sessions/new'

  resources :reservations 
  resources :users, only: [:new, :edit, :show, :destroy, :create]
  resources :restaurants, only: [:new, :edit, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
end
