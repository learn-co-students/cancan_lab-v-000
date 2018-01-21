class SessionsController < ApplicationController
	def new
	end

	def create
		if params[:name].nil? || params[:name].empty?
			redirect_to '/login', notice: 'Must provide a name.'
		elsif User.find_by(:name => params[:name]).nil?
			redirect_to '/users/new', notice: 'Looks like you need to sign up.'
		elsif User.find_by(:name => params[:name])
			@user = User.find_by(:name => params[:name])
			log_in @user 
			flash[:success] = 'Welcome!'
			redirect_to '/'
		end
	end

	def destroy
		session.clear
		redirect_to '/login'
	end
end
