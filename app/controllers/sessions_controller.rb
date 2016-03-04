class SessionsController < ApplicationController

	def new
	end

	def create
		session[:username] = params[:username]
		redirect '/'
	end

	def destroy
		session.delete :username
		redirect '/'
	end

end
