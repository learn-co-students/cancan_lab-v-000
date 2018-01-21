class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)

  	if @user 
  	  log_in @user 
  	  flash[:success] = 'Welcome!'
  	  redirect_to '/'
  	else
  	  redirect_to 'users/new'
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name)
  end
end
