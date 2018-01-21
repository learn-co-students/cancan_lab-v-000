class SessionsController < ApplicationController
  def new
  end

  def create
    session[:user_id] = User.find_or_create_by(name: params[:name]).id
    redirect_to notes_path
  end

  def destroy
    session.clear
    redirect_to '/login'
  end
end
