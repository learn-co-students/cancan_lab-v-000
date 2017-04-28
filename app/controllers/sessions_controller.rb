class SessionsController < ApplicationController

  def create

      session[:user_id] = User.find_or_create_by(name: params[:name]).id

    end

    def destroy
      session.delete :user_id
      
    end



end
