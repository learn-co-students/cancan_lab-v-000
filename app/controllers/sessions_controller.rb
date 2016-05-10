class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:notice] = "User does not exist."
      redirect_to login_path
    end
  end

  def destroy
    if session[:user_id]
      reset_session
    end
    redirect_to login_path
  end

end