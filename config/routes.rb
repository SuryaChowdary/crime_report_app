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
  #resources :citizens, only: [:new]
end
