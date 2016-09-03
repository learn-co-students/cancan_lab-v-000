class UsersController < ApplicationController

  def index
  end

  def new
    
  end

  def create
    @user = User.find_or_create_by(name: params[:user][:name])
    if @user
      flash[:success] = 'Account created!'
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end

  end
end
