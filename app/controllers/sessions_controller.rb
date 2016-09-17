class SessionsController < ApplicationController
  def hello
  end
  
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    # else
    #   redirect_to new_session_path
    end

  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
