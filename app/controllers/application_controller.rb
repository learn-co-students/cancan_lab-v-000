class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, flash[:notice] => exception.message
  end

  def logged_in?
    !!current_user
  end

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

end
