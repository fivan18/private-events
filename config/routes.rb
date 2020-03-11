Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :show, :create]
  resources :sessions, only: [:new, :destroy, :create]
end
