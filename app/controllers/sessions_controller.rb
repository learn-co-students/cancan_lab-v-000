class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_or_create_by(name: params[:name])
    params[:name]= session[:name]
    redirect_to notes_path
  end

  def destroy
    session.clear
    redirect_to '/login'
  end

end
