class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user.new(user_params)
		if @user.save
			redirect_to '/notes/new'
		else
			render :new
		end		
	end

	private

	def user_params
		params.require(:user).permit(:name)
	end
end
