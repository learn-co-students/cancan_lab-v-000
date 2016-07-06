class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def new
  end
  
  def create
    if params[:name] && !params[:name].empty?
      @user = User.find_by(name: params[:name])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end
  
  def destroy
    session.clear
    redirect_to root_path
  end
end