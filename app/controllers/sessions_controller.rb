class SessionsController < ApplicationController
  def new
    @user = User.new
    if logged_in?
      redirect_to '/notes'
    end
  end

  def create
    user = User.find_by(name: params[:name])
    session[:user_id] = user.id
    redirect_to '/notes'
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
