class FollowersController < ApplicationController
  before_action :find_user

  def index
    @users = @user.followers.search_by_name(params[:key]).page params[:page]
  end
end
