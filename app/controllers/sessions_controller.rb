class SessionsController < ApplicationController

  def home
    if current_user
      session[:user_id] = current_user.id
      redirect_to notes_path
    end
  end

  def login
    @user = User.find_by(name: params[:name])

    if !@user.nil?
      session[:user_id] = @user.id
      redirect_to notes_path
    else
      redirect_to new_user_path
    end
  end

  def current_user
    @user = User.find_by_id(session[:user_id])
  end

end
