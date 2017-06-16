class SessionsController < ApplicationController

  def new
    redirect_to notes_path if current_user
  end

  def create
    user = User.find_by(name: params[:name])
    if user
      session[:user_id] = user.id
      redirect_to notes_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id if logged_in?
    redirect_to login_path
  end
end
