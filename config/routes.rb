Rails.application.routes.draw do
  root 'pages#home' 
  get 'about', to: 'pages#about'
  get 'citizens/new', to: 'citizens#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users , except: [:new]
  resources :cities
  resources :localities
  resources :crimes
  resources :crime_reporters
  get 'pages/about' , to: 'pages#about'
  get '/locality_by_city', to: 'crimes#locality_by_city', as: 'locality_by_city'
  get '/update_locality', to: 'citizens#update_locality', as: 'update_locality'

end
