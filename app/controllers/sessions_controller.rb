class SessionsController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_or_create_by(:name => session_params[:name])
        session[:id] = @user.id
        redirect_to root_path
    end
    
    def destroy
        session[:id] = nil
        redirect_to root_path
    end

    private
    def session_params
        params.permit("name") 
    end
    
    
end