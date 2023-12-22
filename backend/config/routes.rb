Rails.application.routes.draw do
  # Auth0 callback route
  get '/auth/auth0/callback' => 'auth0#callback'

  #user routes
  resources :users do
    resources :stories, only: [:index, :show, :create, :update, :destroy] do
      post :regenerate, on: :member
      resources :pages, only: [:index, :show, :create, :update, :destroy] do
        post :regenerate, on: :member
      end
    end
  end
end
