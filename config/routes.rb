require 'sidekiq/web'

Rails.application.routes.draw do
  get 'pages/terms'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/latest', to: 'reviews#latest', as: 'latest_reviews'
  get 'top/index'
  get 'terms', to: 'pages#terms'
  get 'tags/:tag', to: 'aquariums#index', as: :tagged
  get 'autocomplete', to: 'aquariums#autocomplete'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resource :user, only: %i[show edit update], controller: 'users' do
    get 'mypage', on: :collection, as: :mypage
  end

  resources :rankings, only: [:index]

  root to: 'top#index'

  # Sidekiq Web UI の設定（管理者のみアクセス可能にする場合）
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :aquariums, only: %i[index show] do
    get :autocomplete, on: :collection
    get :nearby, on: :collection # ここで現在地から近い順に水族館を表示するルートを追加
    resources :reviews, only: %i[index new create edit update destroy]
    resource :like, only: %i[create destroy], controller: 'like_aquarias'
  end

  resources :reviews do
    resources :replies, only: %i[create destroy edit update]
  end

  namespace :admin do
    resources :users, only: [:index] do
      member do
        delete :destroy_user
        delete :destroy_review
      end
    end
  end
end
