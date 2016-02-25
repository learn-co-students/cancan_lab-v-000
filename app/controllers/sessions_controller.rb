class SessionsController < ApplicationController
  def new
    # nothing to do here!
  end

  def create
    session[:user_id] = params[:user_id]
    redirect '/'
  end

  def destroy
    session.delete :name
  end
end
