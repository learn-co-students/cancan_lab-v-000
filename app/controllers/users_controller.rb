class UsersController < ApplicationController
  def create
    @user=User.create(user_params)
    raise @user.inspect

  end


  private
    def user_params
      params.require(:user).permit(:name)
    end

end
