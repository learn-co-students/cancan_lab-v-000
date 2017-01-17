require 'pry'
class SessionsController < ApplicationController


  def create

    user = Session.find_or_create_by(params[:name])

      session[:user_id] = user.id
      redirect_to :back

  end

  def destroy
    session.delete :user_id
    redirect_to :back
  end


end
