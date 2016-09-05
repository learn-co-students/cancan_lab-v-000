class SessionsController < ApplicationController
  def new
    redirect_to notes_index unless !current_user
  end

  def create
    return head(:unprocessable) unless params[:name]
    session[:user_id] = User.find_or_create_by(name: params[:name]).id
    redirect_to '/'
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
