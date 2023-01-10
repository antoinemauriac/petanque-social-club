Rails.application.routes.draw do
  namespace :users do
    get 'games/index'
  end
  devise_for :users, controllers: {
    :sessions => "users/sessions",
    :registrations => "users/registrations" }

  resources :profile_pictures, only: %i[new create edit update]

  root to: "pages#home"
  get "accueil", to: "pages#accueil"

  get 'users/:id/games', to: 'users/games#index'

  resources :leagues, only: %i[new create show index] do
    member do
      get 'choose_mode'
      post 'choose_mode_create'
      get 'choose_teams'
      post 'choose_teams_create'
    end
    resources :team_users, only: %i[new create]
    resources :games, only: %i[show edit index]
    resources :messages, only: %i[create index]
  end

  resources :users, only: %i[show]

  get "/community", to: "invitations#community", as: :community
  resources :invitations, only: :create

# get '/leagues/:id/team_users/new', to: 'team_users#new'   --- could be a path to any custom mehtod

  resources :games, only: %i[new create show update] do
    member do
      get 'choose_game_teams'
      post 'choose_game_teams_create'
    end
  end
  resources :fields, only: :index

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
