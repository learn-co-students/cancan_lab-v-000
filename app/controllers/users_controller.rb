class UsersController < ApplicationController
  has_many :notes
  has_many :viewers


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
