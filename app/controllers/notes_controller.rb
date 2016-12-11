class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :update]

  def index
    @notes = Note.none
    if logged_in?
      @notes = current_user.readable
    end
  end

  def new
    @note = Note.new
  end

  def create
    note = Note.new(note_params)
    if note.valid?
      note.user = current_user
      note.save
      redirect_to root_path, alert: "Note successfully created!"
    else
      redirect_to new_note_path, alert: "Unsuccessful. Please, try again."
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to root_path, alert: "Note successfully updated!"
    else
      redirect_to update_note_path(@note), alert: "Update unsuccessful. Please, try again."
    end
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
