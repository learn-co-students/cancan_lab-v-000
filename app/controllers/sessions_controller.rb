class SessionsController < ApplicationController

  def login
  end

  def create
    #raise "IN CREATE METHOD".inspect

    if params[:name].nil? || params[:name].empty?
      redirect_to login_path
    else
      session[:user_id] = User.find_or_create_by(name: params[:name]).id
      redirect_to root_path   
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

end
