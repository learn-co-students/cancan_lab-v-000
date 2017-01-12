class SessionsController < ApplicationController

  def new
  end
  
  def create
    if params[:name]
      @user = User.find_or_create_by(name: params[:name])
      session[:user_id] = @user.id
    end
    redirect_to root_path
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
