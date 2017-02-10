class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    if current_user.nil?
      redirect_to root_path, :alert => exception.message
    else
      redirect_to root_path, :alert => "You can't read that note"
    end
  end

  def current_user
    @user ||= User.find_by_id(session[:user_id])
  end
end
