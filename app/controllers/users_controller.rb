class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = user_class.all
  end

  def new
    @user = user_class.new
  end

  def create
    @user = user_class.create!(users_params)
  end

  def update
    @user = user_class.find(params[:id])
    @user.update_attributes(users_params)
  end

private

  def user
      User.user_type.include?(params[:type]) ? params[:type] : "User"
  end

  def user_class
      user.constantize
  end

  def users_params
    params.require(user.underscore.to_sym).permit(:name,:email,:type,:password,:password_confirmation)
  end

end
