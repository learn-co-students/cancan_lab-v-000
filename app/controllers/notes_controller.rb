class NotesController < ApplicationController


	def index

	end

	def new
		@note = Note.new
	end

	def create
		if @user = current_user
			note = @user.notes.create(note_params)
			note.readers << @user
			note.save
		end
		redirect_to "/"
	end

	def show

	end

	def edit

	end

	def update
		note = Note.find(params[:id])
		note.readers.clear
		note.update(note_params)
		note.readers << @user
		note.save
		redirect_to '/'
	end


	def destroy

	end

	private

	def note_params
		params.require(:note).permit(:content, :visible_to)
	end
end
