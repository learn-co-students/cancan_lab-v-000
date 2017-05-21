class SessionsController < ApplicationController

  def new 
  end

  def create
    if params[:name].present?
      User.find_or_create_by(name: params[:name])
      session[:name] = params[:name]
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