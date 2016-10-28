class NotesController < ApplicationController

	include SessionsHelper

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
		Note.find(params[:id]).delete
	end

	def update
		@note = Note.find(params[:id])
		if @note.user == current_user && @note.update(note_params)
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