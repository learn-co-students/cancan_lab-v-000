class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  helper_method :current_user
  
  def current_user
    User.find_by(id: session[:user_id]) if session.include? :user_id
  end
  
  private
  
  def require_login
    redirect_to root_path unless session.include? :user_id
  end
end
