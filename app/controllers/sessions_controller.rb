class SessionsController < ApplicationController

	def create
		@user = User.find_by(name: params[:user][:name])
		return head(:forbidden) unless params[:name]
		session[:user_id] = @user.user_id
		redirect_to '/'
	end

	def destroy
		session.clear
		redirect_to '/'
	end
end
