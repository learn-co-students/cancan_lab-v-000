class SessionsController < ApplicationController
  def create
    session[:user_id] = User.find_by(name: params[:name]).id
    redirect_to '/'
  end

  def destroy
    session.delete :user_id
  end
end
