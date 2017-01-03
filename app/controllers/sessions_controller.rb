class SessionsController < ApplicationController

	def create	
		session[:user_id] = User.find_or_create_by(name: params[:user][:name]).id
		redirect_to root_path
	end

	def destroy
		session.delete :user_id
		redirect_to root_path
	end
end
