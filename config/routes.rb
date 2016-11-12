Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
	root 'home#index'


  controller :users do
    get 'user/login'      => :login, as: 'login'
    post 'user/login'     => :signin, as:'signin'
    get 'user/new'        => :new, as:'new'
    post 'user/signup'    => :create, as:'signup'
    delete 'user/logout'  => :destroy, as:'logout'
  end

  controller :posts do
    get 'post/new'        => :new, as:'post_new'
    post 'post/new'    => :create, as:'post_create'
  end

end
