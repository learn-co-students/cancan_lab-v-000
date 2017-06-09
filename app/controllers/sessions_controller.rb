class SessionsController < ApplicationController
    def create
        session[:user_id] = params[:name]
        redirect_to root_path
    end

    def destroy
        session.delete :user_id
        redirect_to :back
    end
end
