class SessionsController < ApplicationController

  def create
    if user = User.find_by(name: params[:user][:name])
      session[:user_id] = user.id
      redirect_to notes_path
    end
    binding.pry
      redirect_to users_new_path
  end
end
