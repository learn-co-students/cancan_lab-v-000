class SessionsController < ApplicationController
  def new
  end
  
  def create 
    user = User.find_or_create_by(session_params)
    session[:user_id] = user.id
    redirect_to root_path
  end
  
  def destroy 
    session.delete :user_id
    redirect_to root_path
  end
  
  private 
  
  def session_params
    params.permit(:name)
  end
end
