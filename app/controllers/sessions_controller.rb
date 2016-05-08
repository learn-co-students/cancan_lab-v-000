class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])

    return redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = user.id
    @user = user
    redirect_to controller: 'notes', action: 'index'
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
