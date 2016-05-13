class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:name]) if params[:name]
    session[:user_id] = user.id if user.valid?
    redirect to '/'
  end


  def destroy
  end
end
