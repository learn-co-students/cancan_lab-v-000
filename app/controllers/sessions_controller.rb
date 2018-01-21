class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user
      session[:user_id] = user.id
      redirect_to notes_path
    else
      redirect_to new_user_path, notice: "This user is not yet registered"
    end
  end

  def destroy
    session.delete :user_id
    redirect_to notes_path
  end
end
