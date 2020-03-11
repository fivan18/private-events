Rails.application.routes.draw do
  root 'users#show'
  get '/signup', to: 'users#new'

  resources :users, only: [:new, :show, :create]
end
