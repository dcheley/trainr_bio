Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: "users/registrations",
    confirmations: "users/confirmations"
  }

  resources :users, only: [:show, :index, :edit, :update, :destroy]
  resources :studios
  resources :events
  resources :offers
  resources :after_signup

  # get 'home' => 'users#home', as: :home
  post 'landing_email' => 'users#landing_email', as: :landing_email
  get 'forgot_password' => 'users#forgot_password', as: :forgot_password
  get 'pre_launch_landing' => 'users#pre_launch_landing', as: :pre_launch_landing
  get 'pre_launch_reservation' => 'users#pre_launch_reservation', as: :pre_launch_reservation
  get 'verification' => 'users#verification', as: :verification
  get 'mytrainers' => 'users#mytrainers', as: :mytrainers
  get 'settings' => 'user#settings', as: :settings
  get 'profile' => 'user#profile', as: :profile
  get 'managetrainers' => 'studio#managetrainers', as: :managetrainers

  root to: 'users#pre_launch_landing'
end
