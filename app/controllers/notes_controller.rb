class NotesController < ApplicationController
	def index
	end

	def show
    @note = Note.find(params[:id])
	end

	def new
	end

	def create
		note = Note.new(note_params)
		if session.key?('user_id')
			note.user_id = session[:user_id]
			note.save
		end
		redirect_to root_path
	end

	def edit
	end

	def update
		note = Note.find(params[:id])
		# binding.pry
		note.update(note_params)
		authorize! :update, note
		binding.pry
		redirect_to root_path
	end

	def destroy
	end

	private

	def note_params
		params.require(:note).permit(:content, :visible_to)
	end

end
