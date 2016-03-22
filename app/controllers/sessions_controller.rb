class SessionsController < ApplicationController
  def create
    session[:username] == params[:username]
    redirect_to root_path 
  end

  def destroy
    session.delete :username
    redirect_to root_path
  end

end