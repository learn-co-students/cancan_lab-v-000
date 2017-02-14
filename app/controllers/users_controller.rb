class UsersController < ApplicationController
  def create
    User.create(name: params[:name])    
  end
end
