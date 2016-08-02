class SessionsController < ApplicationController
  def new
    
  end

   def create
    if params[:name] == nil || params[:name] == ""
      redirect_to login_path
    else
      @user = User.find_or_create_by(name: params[:name])
      session[:user_id] = @user.id
      redirect_to new_note_path, :notice => "Logged in Successfully"
    end
  end
end
