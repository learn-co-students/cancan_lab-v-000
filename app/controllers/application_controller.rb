class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  skip_before_action :require_login, only: [:index]

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end



 private

   def require_login
    #  unless logged_in?
     unless session.include? :user_id
       flash[:error] = "You must be logged in to access this section"
         redirect_to '/'
         # halts request cycle
     end
   end

end
