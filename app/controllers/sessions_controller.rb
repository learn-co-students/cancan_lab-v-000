class SessionsController < ApplicationController
	def new
  end

  def create
    return head(:unprocessable) unless params([:name])
    session[:user_id] = User.find_or_create_by(name: params[:name]).id
    redirect_to :back
  end

  def destroy
    session.delete :user_id
    redirect_to :back
  end


	# def new
	# end

	# def create
	# 	if user = User.find_by(name: params[:name])
	# 		session[:user_id] = user.id
	# 		redirect_to notes_path
	# 	else
	# 		redirect_to login_path
	# 	end
	# end

	# def destroy
	# 	session[:user_id].clear
	# 	redirect_to login_path
	# end



	# private

	# 	def session_params
	#   	params.require(:user).permit(:name)
	# 	end

end
