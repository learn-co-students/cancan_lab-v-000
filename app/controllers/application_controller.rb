class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private
  def current_user
    if !session[:id].nil?
      user ||= User.find_by_id(session[:id])
    end
  end

  helper_method :current_user
end
