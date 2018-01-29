class NotesController < ApplicationController
	load_and_authorize_resource

	def index
		@notes = Note.all
	end

	def new
		@note = Note.new
	end

	def show
		@note = Note.find(params[:id])
	end

	def create

		@note = Note.new(note_params)
		@note.user = current_user
		@note.save
		redirect_to root_path, alert: 'note successfully created'

	end

	def edit
		@note = Note.find(params[:id])
	end

	def update
	  @note.update(note_params)
		redirect_to root_path, alert: 'note successfully updated'
	end

	def destroy
		@note = Note.find(params[:id])
		@note.destroy
		redirect_to notes_path, alert: "note successfully destroyed"
	end

	private

	def note_params
		params.require(:note).permit(:content, :visible_to)
	end


end
