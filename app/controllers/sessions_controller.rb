class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_or_create_by(:name => name)
        session[:user_id] = user.id
    end

    def delete
        session.delete :user_id
        redirect_to '/signin'
    end
end
