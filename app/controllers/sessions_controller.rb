class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_or_create_by(name: [params[:name])
    if user
      session[:user_id] = user.id
      redirect_to '/'
    else
      render :new
    end
  end

  def destory
    session.clear
    redirect_to '/'
  end
end
