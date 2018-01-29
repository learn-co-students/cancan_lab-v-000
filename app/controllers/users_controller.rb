class UsersController < ApplicationController
  def create
    User.find_or_create_by(name: params[:name])
    redirect_to '/'
  end
end
