class NotesController < ApplicationController

	def index
		if session[:user_id].nil?
			@notes = Note.none
		elsif session[:user_id]
			@notes = Note.where(user: current_user)
		end
		
	end

	def new
		@note = Note.new
	end

	def create
		@note = Note.new(note_params)
		@note.user = current_user
		if @note.save
			redirect_to notes_path, notice: "Note successfully created :)"
		else
			render :new, alert: "Oops, something went wrong, please try again."
		end
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private
		def note_params
			params.require(:note).permit(:content)
		end
end
