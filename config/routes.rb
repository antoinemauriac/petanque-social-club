Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "profile", to: "pages#profile"
  get "accueil", to: "pages#accueil"

  resources :leagues, only: %i[new create show index] do
    resources :team_users, only: %i[new create]
    resources :games, only: %i[new show edit index]
    resources :messages, only: %i[create index]
  end

# get '/leagues/:id/team_users/new', to: 'team_users#new'   --- could be a path to any custom mehtod

  resources :games, only: :update
  resources :fields, only: :index
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
