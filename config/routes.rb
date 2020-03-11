Rails.application.routes.draw do
  get '/signup', to: 'users#new'

  resources :users, only: [:new, :index, :create]
end
