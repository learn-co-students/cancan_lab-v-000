class SessionsController < ApplicationController
  def new
  end

  def create
    # if !params[:name].present?
    #   redirect_to login_path
    # else
    #   session[:user_id] = User.find_or_create_by(name: params[:name]).id
    #   redirect_to notes_path
    # end

    return head(:unprocessable) unless params[:name]
    session[:user_id] = User.find_or_create_by(name: params[:name]).id
    redirect_to root_path
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
