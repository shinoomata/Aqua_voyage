Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'aquariums/index'
  get 'aquariums/show'
  get 'top/index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root to: 'top#index'

  resources :aquariums, only: [:index, :show] do
    resources :reviews, only: [:new, :create, :edit, :update]
  end
end
