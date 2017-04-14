class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', :alert => exception.message
  end

  def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session.key? :user_id
  end

  def logged_in?
    !!current_user
  end
end
