class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user
  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to root_url, :alert => exception.message
  end
  
  private
  
  	def logged_in?
  		!session[:user_id].nil?
  	end
  	
  	def current_user
  		@user = (User.find_by(id: session[:user_id]) || User.new)
  	end
  
  
end
