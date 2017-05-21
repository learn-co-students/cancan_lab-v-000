class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find_by(name: session[:name])
  end
  helper_method :current_user


  def signed_in_user
    if !current_user
      redirect_to root_path, alert: "Please sign in."
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      redirect_to root_path, alert: exception.message
    end
  end
  
end
