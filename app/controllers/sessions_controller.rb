class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      flash[:success] = "Hi, #{@user.name}"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to users_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
