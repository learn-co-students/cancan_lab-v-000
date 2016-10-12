require 'pry'
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to notes_path
    else
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:name)
  end

end
