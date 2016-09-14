class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user.present?
      log_in(user)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
  
end
