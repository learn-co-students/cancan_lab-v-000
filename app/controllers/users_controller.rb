class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.find_or_create_by(user_params)
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
