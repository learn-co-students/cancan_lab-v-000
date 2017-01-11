require 'pry'

class SessionsController < ApplicationController
  
  def create
    if params[:name]
      session[:name] = params[:name]
    end
    redirect_to root_path
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
