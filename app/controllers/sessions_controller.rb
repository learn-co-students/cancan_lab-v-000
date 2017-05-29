class SessionsController < ApplicationController

  def create
    if params[:name].present?
      session[:user_id] = User.find_or_create_by(name: params[:name]).id
      redirect_to notes_path
    else 
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end