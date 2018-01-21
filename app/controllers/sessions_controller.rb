class SessionsController < ApplicationController

  def new
  end

  def create
    session[:user_id] = User.find_or_create_by(name: params[:name]).id
  end

  def destroy
    session.destroy
  end
end