Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  get '/home', to: 'sessions#home'
  get '/login', to: 'sessions#new'
end
