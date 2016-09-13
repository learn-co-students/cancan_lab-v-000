class SessionsController < ApplicationController

  def create
    redirect_to '/' if !User.find_by(name: params[:name])
    session[:user_id] = User.find_by(name: params[:name]).id
  end

  def destroy
    session[:user_id] = nil
  end
end
