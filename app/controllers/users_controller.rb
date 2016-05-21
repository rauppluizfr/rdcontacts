class UsersController < ApplicationController

  def index
    @users = user_class.all
  end

  def new
    @user = user_class.new
  end

  def create
    @user = user_class.create!(users_params)
  end

private

  def user
      User.user_type.include?(params[:type]) ? params[:type] : "User"
  end

  def user_class
      user.constantize
  end

  def users_params
    params.require(user.underscore.to_sym).permit(:name,:email,:type)
  end

end
