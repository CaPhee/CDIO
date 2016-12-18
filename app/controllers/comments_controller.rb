class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:destroy, :edit, :update, :create]
  def create
    @cmt = current_user.comments.build comment_params
    if @cmt.save
      flash[:info] = "Success"
      redirect_to @cmt.post
    else
        flash[:info] = @cmt.errors.full_messages.join(" ")
        redirect_to root_url
    end
  end
  private
  def comment_params
    params.require(:comment)
      .permit :comment,:post_id
  end
end
