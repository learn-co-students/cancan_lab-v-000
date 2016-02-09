class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def index
    @notes = Note.all
  end

  def new
  end

  def create
    if logged_in?
      note = current_user.notes.build(note_params)
      note.readers << current_user
      note.save
    end
    redirect_to '/'
  end

  def edit
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
