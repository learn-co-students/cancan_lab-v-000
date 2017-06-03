class UsersController < ApplicationController
    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to '/'
        else
            redirect_to '/signin'
        end
    end

    private
    def user_params
        params.require(:user).permit(:name)
    end
end
