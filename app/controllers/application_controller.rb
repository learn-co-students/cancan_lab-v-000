class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_url, :alert => exception.message
    end

    def user_signed_in?
        !(session[:id].nil?)
    end
    def current_user
        User.find_by(:id => session[:id])
    end

    helper_method :user_signed_in?
    helper_method :current_user
end
