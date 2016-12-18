Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'
	root 'home#index'

    get '/404' ,to: redirect('/404') , as: 'not_found'
    get '/422', to: redirect('/422'), as: 'change'
    get '/500', to: redirect('/500')

  resources :users do
    resources :following, only: :index
    resources :followers, only: :index
  end
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
  resources :follows, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]

end
