Rails.application.routes.draw do
  get 'games/index'
  get 'games/new'
  get 'games/create'
  get 'games/show'
  get 'games/edit'
  get 'games/update'
  devise_for :users
  root to: "pages#home"

  resources :leagues, only: %i[new create show] do
    resources :games, only: %i[new create show edit update index]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
