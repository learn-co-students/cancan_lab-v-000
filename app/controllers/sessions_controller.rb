class SessionsController < ApplicationController
  def create
    if user = User.find_by(:name => params[:name])
      session[:user_id] = user.id
    else
      flash[:notice] = "User not found"
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
  end
end
