class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def current_user
    if logged_in?
      User.find(session[:user_id])
    end
  end

  def logged_in?
    !!session[:user_id]
  end
end
