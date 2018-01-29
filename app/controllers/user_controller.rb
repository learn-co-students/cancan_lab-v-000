class UserController < ApplicationController
  def create
    @user = User.create(params[:name])
    session[:name] = @user.name
  end

end