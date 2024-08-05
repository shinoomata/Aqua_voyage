Rails.application.routes.draw do
  get 'pages/terms'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/latest', to: 'reviews#latest', as: 'latest_reviews'
  get 'aquariums/index'
  get 'aquariums/show'
  get 'top/index'
  get 'terms', to: 'pages#terms'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root to: 'top#index'

  resources :aquariums, only: [:index, :show] do
    resources :reviews, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
