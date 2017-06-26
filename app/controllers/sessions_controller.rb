class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(name: session_params[:name])
      session[:user_id] = @user.id
      redirect_to notes_path
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def session_params
    params.require(:user).permit(:name)
  end
end
