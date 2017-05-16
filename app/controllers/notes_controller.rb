class NotesController < ApplicationController
	before_action :not_logged_in?
	

	def create
		@note = Note.new(note_params)
		@note.user = current_user
		@note.save ? (redirect_to "/") : (render :new)
	end

	def update
		@note = Note.find(params[:id])
		#binding.pry
		@note.update(note_params) ? (redirect_to "/") : (render :edit)
	end

	private

		def note_params
			params.require(:note).permit(:content, :visible_to)
		end

		def not_logged_in?
			redirect_to "/" if !logged_in?
		end		
end