Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'pages#welcome'
  get 'welcome', to: 'pages#welcome'
  get 'login', to: 'pages#login'
  get 'addplant', to: 'pages#addplant'
  get 'users', to: 'pages#application'
  get '/dashboard', to: 'plants#index', as: 'dashboard'
  get 'send_reminder', to: 'reminders#send_reminder'
  
  devise_for :users

  resources :plants

end
