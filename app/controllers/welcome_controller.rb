class WelcomeController < ApplicationController
  
  def home
  	redirect_to '/' if !logged_in
  	@user = User.find_by(id: session[:user_id])
  end

end
