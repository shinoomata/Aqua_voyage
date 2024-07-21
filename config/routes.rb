Rails.application.routes.draw do
  get 'aquariums/index'
  get 'aquariums/show'
  get 'top/index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: 'top#index'

  resources :aquariums, only: [:index, :show]
end
