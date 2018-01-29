class SessionsController < ApplicationController

  def new
  end

  def create
    redirect_to login_path unless params[:name]
    session[:user_id] = User.find_or_create_by(name: params[:name]).id
    redirect_to '/'
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

end