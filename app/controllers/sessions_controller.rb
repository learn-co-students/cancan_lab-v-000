class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: post_params[:name])
    if @user
      session[:user_id] = @user.id
    else
      @user = User.new(name: post_params[:name])
      render(:new)
    end
  end

  def destroy
    session.destroy(:user_id)
  end

  private
  def post_params
    params.require(:user).permit(:name)
  end
end
