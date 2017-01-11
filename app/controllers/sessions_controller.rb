class SessionsController < ApplicationController

  def create
    if params[:name]
      @user = User.find_or_create_by(name: params[:name])
      session[:name] = @user.name
    end
    redirect_to root_path
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
