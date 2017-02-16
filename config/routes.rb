Rails.application.routes.draw do

  #App resources
  resources :users
  resources :jobs

  #Root path
  root 'sessions#new'

  #For login/out functionality
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #For viewing totals
  get "/totals", to: "jobs#totals"
end
