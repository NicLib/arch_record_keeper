Rails.application.routes.draw do
  resources :jobs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'jobs#index'
  
  get "job/totals", to: "jobs#totals", as: "totals"
end
