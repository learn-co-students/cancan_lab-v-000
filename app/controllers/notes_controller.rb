class NotesController < ApplicationController

	load_and_authorize_resource only: [:edit, :show, :update]

	def new
		@note = Note.new
	end

	def create
		@note = Note.new(note_params)
		@note.user = current_user
		if @note.save
			redirect_to '/'
		else
			render :new
		end		
	end

	def edit
		set_note
	end

	def update
		set_note
		if @note.update(note_params)
			redirect_to '/'
		else
			render :edit
		end		
	end

	private

	def set_note
		@note = Note.find(params[:id])
	end

	def note_params
		params.require(:note).permit(:content, :visible_to)
	end
end
