Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  #get '/crime_report', to: 'citizens#new'
  resources :cities
  resources :localities
  resources :crimes
  resources :crime_reporters
  resources :citizens, only: [:new]
end
