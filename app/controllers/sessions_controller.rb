class SessionsController < ApplicationController
  def new
  end

  def create
    session[:user_id] = User.find_or_create_by(name: params[:name]).id
    # if session[:user_id].nil? || session[:user_id].empty?
    #   redirect_to sessions_new_path
    # else
    #   redirect_to '/'
    # end
end
