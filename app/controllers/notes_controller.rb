class NotesController < ApplicationController
   load_and_authorize_resource only: [:edit,  :update]

   def new
    render 'new', locals: {note: Note.new}
   end

   def create
    note = Note.new(note_params)
    note.user = current_user
    note.save!
    redirect_to root_path
   end

   def edit
   end

   def update
    @note.update(note_params)
    redirect_to root_path
   end

   def show
   end

    def index
      @notes = Note.none
      if current_user
        @notes = current_user.readable
      end
    end

    private

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end

    def current_user
      User.find_by(id: session[:user_id])
    end
  end

