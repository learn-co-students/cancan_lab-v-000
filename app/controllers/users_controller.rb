class UsersController < ApplicationController
  before_action :authentication_required
  skip_before_action :authentication_required, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to notes_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
