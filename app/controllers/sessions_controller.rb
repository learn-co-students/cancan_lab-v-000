class SessionsController < ApplicationController
  def new

  end

  def create
    binding.pry
    @user = User.find_by(name: params[:name])
    session[:user_id] = @user.id
    redirect_to new_note_path
  end

end
