class SessionsController < ApplicationController

  def new
  end

  def create
    # http://guides.rubyonrails.org/layouts_and_rendering.html#the-status-option
    return head(:not_acceptable) unless params[:name]
    session[:user_id] = User.find_or_create_by(name: params[:name]).id
    redirect_to root_path
  end

  def destroy
    session.delete :user_id
    redirect_to root_path 
  end
end
