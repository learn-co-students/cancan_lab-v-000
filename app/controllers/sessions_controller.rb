class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:name].blank?
     redirect_to login_path, alert: "Username cannot be blank."
   else
     user = User.find_by(name: params[:name])
     session[:user_id] = user.id
     redirect_to root_path
   end
  end

  def destroy
    session.delete :name
    redirect_to login_path
  end

end
