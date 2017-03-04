class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

    def current_user
        # session[:user_id]
        User.find(session[:user_id]) if session[:user_id]
        # binding.pry
    end

  private

  def require_login
    redirect_to root_path unless session.include? :user_id
  end

end
