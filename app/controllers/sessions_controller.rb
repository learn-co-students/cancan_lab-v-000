class SessionsControlelr < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      session[:name] = @user.name
    else
      redirect_to sessions_path, flash[:alert] = "User not found"
    end
  end

  def destroy
    session.delete :name
  end
end