class HomeController < ApplicationController
  def index
    @posts = Post.all.per_page_kaminari params[:page]
  end
end
