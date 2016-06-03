class SessionsController < ApplicationController




 
  def create
    binding.pry

  @user = User.find_by(name: params[:user][:name])
  binding.pry
  if @user.authenticate(params[:user][:password])
   
    session[:user_id] = @user.id
  else
    redirect_to 'users/new'
  end
  end




  def destroy

    session.clear if session[:name] != nil
    redirect_to '/'
  end

end