Rails.application.routes.draw do
  get 'google_login_api/callback', to: 'google_login_api#callback'
  root 'pages#top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/auth/:provider/callback', to: 'sessions#google_auth'
  get '/auth/failure', to: redirect('/')
  delete '/logout', to: 'sessions#destroy'
end
