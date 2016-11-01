class SessionsController < ApplicationController
  def create
    return head(:unprocessable) unless params[:name]
    session[:user_id] = User.find_or_create_by(name: params[:name]).id
    redirect_to notes_path
  end

  def destroy
    session.destroy
    redirect_to :back
  end
end
