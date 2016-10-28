class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(session_params)
  	if @user
  		session[:user_id] = @user.id
  	else

  	end
  end

  def destroy
  end

  def session_params
  	params.require[:user].permit[:name]
  end
end
