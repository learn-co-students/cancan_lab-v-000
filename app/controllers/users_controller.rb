class UsersController < ApplicationController
  def create
    User.create(name: params[:name])
    redirect_to notes_path
  end

end
