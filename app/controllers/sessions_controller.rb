class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_or_create_by(name: params[:name])
    session[:user_id] = @user.id
    redirect_to notes_path
  end

  def destroy
    # session.clear             # Solution 1

    # session.delete :user_id   # Solution 2
    # redirect_to :back

    reset_session        # Logs out the user
    redirect_to login_path
  end

end