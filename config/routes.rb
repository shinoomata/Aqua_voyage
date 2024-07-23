Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root to: 'top#index'

  resources :aquariums, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end
end

