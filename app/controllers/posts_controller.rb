class PostsController < ApplicationController
    before_action :logged_in_user, except: [:show,:index,:search]
    def index
    end

    
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(params.require(:post).permit(:title, :content,:location_id))
        @post.assign_attributes(user_id: current_user.id)
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
        @post = Post.includes(:comments).find_by(id: params[:id])
        @user = User.find(@post.user_id)
        @cmt  = @post.comments.build
    end

    def search
        render :text => 'Not Found', :status => '404'
    end
end
