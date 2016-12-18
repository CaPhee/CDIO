class LikesController < ApplicationController
  before_action :load_like, only: :destroy

  def create
    @like = Like.find_or_initialize_by post_id: params[:post_id],
      user_id: current_user.id
    if @like.save
    end
  end

  def destroy
    @like.destroy
  end

  private
  def load_like
    @like = Like.find_by id: params[:id]
  end
end
