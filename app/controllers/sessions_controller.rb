class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Sucessfully logged in"
    else
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Sucessfully logged out"
  end
end
