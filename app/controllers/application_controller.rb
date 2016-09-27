class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions

  # before_filter do
  #   resource = notes_controller.singularize.to_sym
  #   method = "#{resource}_params"
  #   params[resource] &&= send(method) if respond_to?(method, true)
  # end
 # before_filter :authenticate_user!
 #  rescue_from CanCan::AccessDenied do |exception|
 #    redirect_to root_url, :alert => exception.message
 #  end

  def current_user
    User.find_by(id: session[:user_id])
  end

end
