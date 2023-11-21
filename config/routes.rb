Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users
  resources :articles
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]
  root "articles#index"
end
