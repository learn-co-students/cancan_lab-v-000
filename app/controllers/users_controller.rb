class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:name] && params[:name] != ""
      @user = User.create(user_params)
      redirect_to '/'
    else
      redirect_to new_user_path 
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
