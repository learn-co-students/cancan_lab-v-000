class SessionsController < ApplicationController
  def new
    
  end

  def create
    if params[:name]
      session[:user_id] = User.find_by(name: params[:name]).id
      redirect_to '/'
    else
      redirect_to 'login'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
