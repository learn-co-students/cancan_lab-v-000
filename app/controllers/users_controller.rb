class UsersController < ApplicationController

  def create
    User = User.create(name: params[:name])
  end
  
end
