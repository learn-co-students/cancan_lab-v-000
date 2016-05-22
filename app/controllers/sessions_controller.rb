class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(name: params[:name])
    session[:user_id] = user.id
    redirect_to :back
  end

  def destroy
    session.delete :user_id
    redirect_to :back
  end
end
