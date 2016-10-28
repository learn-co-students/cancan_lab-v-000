class NotesController < ApplicationController

	include SessionsHelper

	# load_and_authorize_resource

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url, :alert => exception.message
	end



	def new

	end

	def create
		if logged_in?
			@note = Note.new(note_params)
			@note.user = current_user
			@note.readers << current_user
			if @note.save
				redirect_to root_path
			else

			end
		else
			redirect_to root_path
		end
	end

	def destroy
		@note = Note.find(params[:id])
		authorize! :update, @note
		@note.delete
	end

	def update
		@note = Note.find(params[:id])
		authorize! :update, @note
		if @note.update(note_params)
			redirect_to root_path
		else
			redirect_to root_path
		end
	end

	def index

	end

	def show

	end

	def edit

	end

	def note_params
		params.require(:note).permit(:content, :user_id, :visible_to)
	end

end