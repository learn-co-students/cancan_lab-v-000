class SessionsController < ApplicationController
  def create
    
    user = User.find_by(name: params[:name])
    if !user.nil?
      session[:id] = user.id
      redirect_to notes_path
    else
      flash[:error] = 'User not found.'
      redirect_to users_create_path
    end
  end

  def destroy
  end

  def home
  end




end
