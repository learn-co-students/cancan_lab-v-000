class UsersController < ApplicationController
  def create
    @user = User.new(get_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/notes'
    else
      render :'sessions/new'
    end
  end

  private

  def get_params
    params.require(:user).permit(:name)
  end
end
