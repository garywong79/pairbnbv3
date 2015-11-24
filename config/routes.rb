Rails.application.routes.draw do
  


  root 'home#index'
  get '/search', to: "home#search", as: "search_result"

  get "/signup", to: "users#new", as: "signup"
  resources :users, only: :create

  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
  get '/auth/facebook/callback', to: 'sessions#omniauth'
  get '/auth/failure', to: redirect('/')
  get '/transactions/new', to: "transactions#new", as: "payment" 
  post '/checkout', to: 'transactions#create', as: 'payment_completed' 

  resources :lists
  # resources :transactions, only: [:new, :create]
  
  resources :lists do
    resources :reservations, only:[:create]
  end

  require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
  end

 
