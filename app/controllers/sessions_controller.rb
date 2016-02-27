class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:name].blank?
      redirect_to login_path
    else
      @user = User.find_or_create_by(name: params[:name])
      session[:user_id] = @user.id
      redirect_to notes_path
    end
  end

  def destroy
    unless session[:user_id].nil?
      session.delete :user_id
    end
    redirect_to login_path
  end
end