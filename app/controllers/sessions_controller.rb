class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by(name: params[:name])
		if user
			session[:user_id] = user.id
			redirect_to root_path
		else
			redirect_to '/login', alert: "invalid username"
		end
	end

	def destroy
		session.delete(:user_id) unless session[:user_id].nil?
		redirect_to root_path, alert: "successfully signed out"
	end
end
