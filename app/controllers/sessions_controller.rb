class SessionsController < ApplicationController

    def new
    end
  
    def create
        if params[:name] == nil || params[:name].empty?

            redirect_to '/', notice: "Please enter a name"
        else
            session[:user_id] = User.create(name:params[:name]).id
            redirect_to '/'
        end
    end
  
    def destroy
      session.delete :name
      redirect_to '/'
    end
end

