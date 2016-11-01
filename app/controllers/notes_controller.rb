class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def edit
    @note = Note.new
  end

  def create
    if logged_in?
      note = Note.create(note_params)
      note.user = current_user
      note.readers << current_user
      note.save!
    end
    redirect_to root_path
  end

  def update
    @note.update(note_params)
    @note.readers << current_user 
    redirect_to root_path
  end



  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
