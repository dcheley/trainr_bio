Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#home'

  resources :users
  resources :studios
  resources :events

  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: :logout

  get 'home' => 'users#home', as: :home
  post 'landing_email' => 'users#landing_email', as: :landing_email
  get 'forgot_password' => 'users#forgot_password', as: :forgot_password
end
