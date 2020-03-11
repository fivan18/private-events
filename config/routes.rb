Rails.application.routes.draw do
  root 'users#show'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  resources :users, only: [:new, :show, :create]
  resources :users, only: [:new, :destroy, :create]
end
