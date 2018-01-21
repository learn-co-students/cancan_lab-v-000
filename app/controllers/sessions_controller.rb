class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    session[:user_id] = params[:id]
    redirect_to new_note_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
