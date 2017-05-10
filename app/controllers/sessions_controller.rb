class SessionsController < ApplicationController
  def create
    if params[:name] != ""
      session[:user_id] = User.find_or_create_by(name: params[:name]).id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
