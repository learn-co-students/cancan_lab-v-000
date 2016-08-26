class SessionsController < ApplicationController
  def new
    
  end

  def create
    if params[:user_id] == nil || params[:user_id].empty?
      redirect_to new_session_path
    else
      session[:user_id]
      redirect_to new_note_path
    end
  end
end