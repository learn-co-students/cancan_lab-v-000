class SessionsController < ApplicationController

  def create
    session[:user_id] = User.find_or_create_by(name: params[:name])
      redirect_to controller: 'application', action: 'application'
    end
  end

  def destroy
    session.destroy
    redirect_to controller: 'sessions', action: 'new'
  end

end
