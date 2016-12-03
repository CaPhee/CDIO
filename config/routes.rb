Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'
	root 'home#index'

    

  resources :users
  get "/profile/:id", to: "users#profile", as: "profile"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :posts
  resources :comments
  get "/new" => "posts#new"
  post "/new" => "posts#create"
  get "show/:id" => "posts#show", as: 'post_show'
  post "search" => "posts#search"


end
