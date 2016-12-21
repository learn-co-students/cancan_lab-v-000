class UsersController < ApplicationController
	require 'pry'
 def new
   @user = User.new
 end


 def create 
	session[:user_id] = User.find_or_create_by(name: params[:user][:name]).id
   	binding.pry
    redirect_to '/'
 end

 def user_params
   params.require(:user).permit(
     :name
   )
 end


end
