
class NotesController < ApplicationController
	
load_and_authorize_resource only: [:edit, :show, :update]

	
	def create
		if logged_in?
			
		
			note = Note.create(post_params)
			note.user = @user
			
			
			#@user.notes << note
			note.readers << @user
			note.save
		end	
		redirect_to root_path
	end
	
	def update
		
			note = Note.find(params[:id])
			note.update(post_params)
			redirect_to root_path
			
		
	end
	
	def index
	end
	
	private
	
		def post_params
			params.require(:note).permit(:content, :visible_to)
		end
	
	
end