class UsersController < ApplicationController

  def new
  @user = User.new
  render :new
  end

  def create
  user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
  @user = User.create(user_params)

  redirect_to index_path
  end
end
