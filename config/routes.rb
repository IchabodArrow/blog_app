Rails.application.routes.draw do
  resources :posts
  resources :users, except: [:index, :destroy]

  resources :sessions, only: [:new, :create, :destroy]

  get '/home', to: 'sessions#home'
  get '/login', to: 'sessions#new'
end
