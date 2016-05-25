class SessionsController < ApplicationController
  def new

    session[:user_id] = User.find_by(name: params[:name]).id
    redirect_to notes_path
  end

  def create
    if user = User.find_by(name: params[:user][:name])
      session[:user_id] = user.id
      redirect_to notes_path
    end
      redirect_to users_new_path
  end
end
