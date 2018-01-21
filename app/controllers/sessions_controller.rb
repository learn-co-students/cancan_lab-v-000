class SessionsController < ApplicationController

	def new
		
	end

	def create
		if params[:username]
			session[:user_id] = User.find_or_create_by(name: params[:username]).id
			redirect_to root_path, notice: "You have been successfully logged in! Congrats."
		else
			render :new, alert: "Couldn't Log In, re-try please"
		end
	end

	def destroy
		# session[:user_id].clear
		session.delete(:user_id)
		redirect_to root_path
	end
end
