class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to root_path
  end

  private

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
  
end
