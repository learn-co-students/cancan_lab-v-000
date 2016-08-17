class SessionsController < ApplicationController

  def new
    session[:user_id] = params[:user_id]
  end

  def create
    user = User.find(id: params[:user_id])
    session[:user_id] = user.id
  end

  def destroy
    session[:user_id].clear
  end
end
