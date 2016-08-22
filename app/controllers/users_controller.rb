class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_or_create_by(name: params[:name])
    session[:user_id] = @user.id
    redirect_to '/'
  end

end
