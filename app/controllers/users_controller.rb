class UsersController < ApplicationController
    def create
    #This is the only route needed
      @user = User.new(user_params)
    end

    private

    def user_params
      params.require(:user).permit(:name, :id)
    end

end
