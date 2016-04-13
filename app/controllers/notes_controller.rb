class NotesController < ApplicationController
	
	def create
		note = Note.new(note_params)
		note.user = current_user
		note.save!
		redirect_to '/'
	end

	def update
		@note = Note.find(params[:id])
		@note.update(note_params)
		redirect_to '/'
	end

	private
	def note_params
		params.require(:note).permit(:content, :visible_to)
	end

end
