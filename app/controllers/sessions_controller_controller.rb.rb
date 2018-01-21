class SessionsControllerController < ApplicationController

  def create
    if params[:name]
      session[:user_id] = User.find_or_create_by(name: params[:name]).id
      redirect_to :back
      #this is slick. Refers back to the page that rendered the form.
  end

  def destroy
    session.destroy :user_id
    redirect_to '/'
  end
  
end