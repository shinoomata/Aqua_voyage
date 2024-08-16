Rails.application.routes.draw do
  get 'replies/create'
  get 'replies/destroy'
  get 'pages/terms'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/latest', to: 'reviews#latest', as: 'latest_reviews'
  get 'top/index'
  get 'terms', to: 'pages#terms'
  get 'tags/:tag', to: 'aquariums#index', as: :tagged

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resource :user, only: [:show], controller: 'users' do
    get 'mypage', on: :collection, as: :mypage
  end

  resources :rankings, only: [:index]

  root to: 'top#index'

  resources :aquariums, only: %i[index show] do
    resources :reviews, only: %i[index new create edit update destroy]
    resource :like, only: %i[create destroy], controller: 'like_aquarias'
  end

  resources :reviews do
    resources :replies, only: [:create, :destroy, :edit, :update]
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
