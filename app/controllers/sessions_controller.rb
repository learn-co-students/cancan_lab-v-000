class SessionsController < ApplicationController
	def new
		@user = User.find_by(:name => params[:session][:name])
		if @user
			session[:user_id] = @user.id
			redirect_to new_note_path
		else
			redirect_to signup_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end