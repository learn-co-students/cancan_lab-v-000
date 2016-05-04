class SessionsController < ApplicationController
  def signup
    @user = User.new
  end

  def login
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      session[:user_id] = @user.id
      redirect_to notes_path
    else
      redirect_to login_path
    end
  end

  def logout
    session.delete :user_id
    redirect_to '/login'
  end
end
