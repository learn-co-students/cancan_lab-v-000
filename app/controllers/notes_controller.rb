class NotesController < ApplicationController
	load_and_authorize_resource

	def index
		if current_user
			@notes = current_user.readable
		else
			@notes = Note.none
		end
	end

	def new
		@note = Note.new
	end

	def create
		@note = Note.create(note_params)
		@note.user = current_user
		@note.readers << current_user
		@note.save
		redirect_to '/'
	end

	def show
		@note = Note.find_by_id(params[:id])
	end

	def edit
		@note = Note.find_by_id(params[:id])
	end

	def update
		@note.update(note_params)
		redirect_to '/'
	end

	private

	def note_params
		params.require(:note).permit(:content, :visible_to)
	end

end
