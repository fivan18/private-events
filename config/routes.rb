Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  #post '/going/:id', to: 'users#event_going'
  get '/going/:id', to: 'users#event_going', as: 'going'
  resources :events, only: [:new, :create, :index, :show]
  resources :users, only: [:new, :show, :create]
  resources :sessions, only: [:new, :destroy, :create]
end
