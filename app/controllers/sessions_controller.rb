class SessionsController < ApplicationController
  def new
    redirect_to 'sessions#create'
  end

  def create
    redirect_to '/login' unless params[:name]
    session[:user_id] = User.find_or_create_by(name: params[:name]).id
    redirect_to '/'
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end
end
