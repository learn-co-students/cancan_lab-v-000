class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  def current_user
    begin
      user = User.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound
      user = nil
    end
    
    user
  end
end
