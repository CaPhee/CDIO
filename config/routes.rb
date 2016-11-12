Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
	root 'home#index'


  resources :users

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

end
