Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :leagues, only: %i[new create show index] do
    resources :games, only: %i[new create show edit index]
    resources :team_users, only: %i[create]
  end


  resources :games, only: :update
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
