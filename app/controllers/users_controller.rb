class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
   # @user = User.find(params[:relationship][:followed_id])
   # User.find(@user.followers.ids, @user.followed_users.ids)
    @user = User.find(params[:id])
    @users = User.all
   # @followed_users = User.followed_users
   # @followers_users = User.followers
    @followed_users = User.find(@user.followed_users.ids)
    @followers_users = User.find(@user.followers.ids)
  end

end
