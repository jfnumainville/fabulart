Rails.application.routes.draw do
  # Auth0 callback route
  get '/auth/auth0/callback' => 'auth0#callback'

  #user routes
   resources :users do
    resources :stories, only: [:index, :show, :update, :destroy] do
      resources :pages, only: [:show, :create, :update, :destroy]
    end
  end

  # Route for creating the first page of a story, which also creates the story itself
  post '/users/:user_id/stories/first_page', to: 'pages#create_first_page'
end
