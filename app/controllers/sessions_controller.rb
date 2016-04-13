class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    session[:user_id] = @user.id
    redirect_to new_note_path
  end

  def destroy
    session.delete :user_id
    redirect_to notes_path
  end
end
