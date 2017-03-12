class NotesController < ApplicationController
	load_and_authorize_resource only: [:edit, :show, :update]

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
		if logged_in?
			@note = Note.new(note_params)
			@note.user = current_user
			if @note.save
				redirect_to root_path, notice: "Note successfully created :)"
			else
				render :new, alert: "Oops, something went wrong, please try again."
			end			
		else
			redirect_to root_path, alert: "You need to be logged in to create a Note"
		end
	end

	def edit
		@note = Note.find_by(id: params[:id])
	end

	def update
		@note = Note.find_by(id: params[:id])
		if @note.update(note_params)
			redirect_to root_path, notice: "Note updated, thanks!"
		else
			redirect_to root_path, alert: "Error updating note"
		end
	end

	def destroy
		
	end

	private
		def note_params
			params.require(:note).permit(:content, :visible_to)
		end
end
