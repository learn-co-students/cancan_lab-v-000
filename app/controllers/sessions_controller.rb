class SessionsController < ApplicationController

  def create
    if params[:name]
      session[:user_id] = User.find_or_create_by(name: params[:name]).id
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    session.clear
    redirect_to :back
  end

end
