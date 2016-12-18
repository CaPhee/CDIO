class FollowingController < ApplicationController
  before_action :find_user

  def index
    @users = @user.following.search_by_name(params[:key]).page params[:page]
  end
end
