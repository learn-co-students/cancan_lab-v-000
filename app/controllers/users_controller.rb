class UsersController < ApplicationController
  
  def create
    @user = User.find_or_create_by(name: params[:user][:name])
    if @user 
      flash[:success] = "Account created!"
      session[:users_id] = @user.id 
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
  end

  def new
  end

end
