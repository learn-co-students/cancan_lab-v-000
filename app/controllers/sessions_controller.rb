class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_or_create_by(id: params[:name])
  end

end
