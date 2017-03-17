class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.create(name: params[:user][:name])
    session[:user_id] = user.id
    redirect_to root_path
  end

end
