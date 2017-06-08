class NotesController < ApplicationController
	load_and_authorize_resource only: [:edit, :show, :update, :new] # why won't we just do the same for create?
	def index
	end

	def create
		note = Note.create(note_params)
		note.user = current_user
		note.save
		# binding.pry
		redirect_to '/'
	end

	def new
	end

	def show
	end

	def update
		@note = Note.find(params[:id])
		@note.update(note_params)
		redirect_to '/'
	end

	def destroy
	end

	def edit
	end

	private
	def note_params
		params.require(:note).permit(:content, :visible_to)
	end
end
