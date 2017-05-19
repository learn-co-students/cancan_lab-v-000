class UsersController < ApplicationController
  def create
  	User.create(name: params[:name])
  	redirect_to root_path
  end
end
