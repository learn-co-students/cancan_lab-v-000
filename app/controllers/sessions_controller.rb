class SessionsController < ApplicationController
  def create
    if params[:name] && params[:name] != ''
      session[:name] = params[:name]
      redirect_to '/'
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete :name
  end
end
