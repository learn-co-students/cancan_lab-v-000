class SessionsController < ApplicationController

  def login
    @user = User.new
  end

  def create
    #raise params.inspect
    if !params[:user][:name].present?
      redirect_to '/login'
    else
      user = User.find_or_create_by(name: params[:user][:name])
      session[:user_id] = user.id
      redirect_to '/'
    end
  end

  def logout
  end

end
