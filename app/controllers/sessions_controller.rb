class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:name])
    if user
      session[:user_id] = user.id 
    end
  end


end