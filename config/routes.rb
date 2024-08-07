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

  resource :user, only: [:show], controller: 'users' do
    get 'mypage', on: :collection, as: :mypage
  end

  root to: 'top#index'

  resources :aquariums, only: %i[index show] do
    resources :reviews, only: %i[index new create edit update destroy]
  end
end
