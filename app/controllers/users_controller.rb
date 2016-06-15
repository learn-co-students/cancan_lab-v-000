class UsersController < ApplicationController
  def create
    User.create(params.require(:user).permit(:name, :visible_to))
  end
end
