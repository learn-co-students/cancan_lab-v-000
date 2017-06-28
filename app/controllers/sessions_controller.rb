class SessionsController < ApplicationController

  def new
    
  end

  def create
    #raise params.inspect
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = user.user_id
    @user = user    
    reirect_to controller: 'welcome', action: 'home'
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
