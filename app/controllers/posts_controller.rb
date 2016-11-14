class PostsController < ApplicationController

    def index
    end

    before_action :logged_in_user
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(params.require(:post).permit(:title, :content))
        @post.assign_attributes(user_id: current_user.id,location_id: 1)
        @post.save
        #render plain: @post.inspect
        if @post.save
            flash[:info] = "Thanh Cong"
            redirect_to root_url
        else
            render "new"
        end
    end

    def show
        @post = Post.find(params[:id])
        @user = User.find(@post.user_id)
        @cmt = Comment.new
    end
end
