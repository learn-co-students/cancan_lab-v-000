class SessionsController < ApplicationController
  
def new
    @user = User.new
  end

  def create
    @user = User.find_by(:name => params[:user][:name])
      if @user 
        session[:user_id] = @user.id
          redirect_to notes_path
         else
        redirect_to login_path
        @end
        
  end
end
