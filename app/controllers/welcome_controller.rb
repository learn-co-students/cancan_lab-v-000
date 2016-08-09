class WelcomeController < ApplicationController

  def home
    @user = current_user
    
    redirect_to login_path if @user.nil?
  end

end
