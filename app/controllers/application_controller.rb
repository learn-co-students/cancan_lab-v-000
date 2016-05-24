class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_url, :alert => exception.message
  end

  def current_user
    return unless session[:user_id]
    @user ||= User.find(session[:user_id])
  end

  def logged_in?
    !!current_user
  end



end
