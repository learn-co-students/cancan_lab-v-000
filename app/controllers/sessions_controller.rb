class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:name].blank?
      redirect_to new_user_session_path
    else
      session[:name] = params[:name]
      redirect_to '/'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
