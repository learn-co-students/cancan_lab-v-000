class SessionsController < ApplicationController

  def sign_up
    @user = User.create(user_params)
  end

  def sign_in
    @user = User.find_by_name(params[:name])
    if @user
      session[:user_id] = user.id
    else
      @error = 'Username or password was incorrect'
    end
      redirect_to '/' 
  end

  def sign_out
    session.clear
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
