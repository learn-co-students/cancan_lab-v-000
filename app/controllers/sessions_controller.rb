class SessionsController < ApplicationController
	def new
  end

  def create
  	@user = User.find_or_create_by(name: params[:name])
  	session[:user_id] = @user.id
  end

  def destroy
  	session.destroy if !session[:name].nil?
  end
end