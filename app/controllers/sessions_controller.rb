class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_or_create_by(name: params[:user][:name])
    session[:user_id] = user.id
    redirect_to root_path
  end

end
