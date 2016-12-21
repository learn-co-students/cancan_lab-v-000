class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  require 'pry'
  def create
  	# binding.pry
    # session[:name] = params[:name]
    # binding.pry
        redirect_to '/'
  end


  def destroy
    session.delete :user_id
    # binding.pry
  end


end
