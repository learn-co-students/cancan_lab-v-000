class SessionsController < ApplicationController
    def create
      session[:username] = params[:username]
      redirect_to '/' 
    end

  def destroy
    session[:username].delete
    redirect_to '/'
  end
end
