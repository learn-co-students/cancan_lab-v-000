class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = User.find_by_name(params[:user][:name])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
