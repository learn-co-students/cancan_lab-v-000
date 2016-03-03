class UsersController < ApplicationController

	def new
		
	end


	def create
		@user = User.create(name: params[:name])
		if @user
			session[:user_id] = @user.id
			redirect_to root_path
		else
			redirect_to '/sign_up', alert: "Invalid entry"
		end
	end
end
