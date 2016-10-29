class UsersController < ApplicationController

  def create
    @user= User.create(user_params)
    redirect_to user_path
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
