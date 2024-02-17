Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
  root 'pages#welcome'
  get 'welcome', to: 'pages#welcome'
  get 'login', to: 'pages#login'
  get 'dashboard', to: 'pages#dashboard'
  get 'addplant', to: 'pages#addplant'
  get 'users', to: 'pages#application'

  devise_for :users

end
