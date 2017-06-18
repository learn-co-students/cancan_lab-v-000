class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(name: post_params[:name])
    redirect_to root_path
  end
end
