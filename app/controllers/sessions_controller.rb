class SessionsController < ApplicationController

  def new
  end  

  def create
    user = User.find_by_name(params[:name])
    if user 
      session[:user_id] = user.id
      redirect_to notes_path
    else  
      redirect_to new_session_path
    end  
  end  

  def destroy
    session.clear
  end  
end
