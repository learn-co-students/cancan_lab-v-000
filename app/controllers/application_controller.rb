class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  private
    def current_user
      @user = User.find_by_id(session[:user_id])
      logged_in = true
      @user
    end

    def logged_in
      !!session[:user_id]
    end
end
