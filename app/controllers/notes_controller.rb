class NotesController < ApplicationController
  load_and_authorize_resource only: [:show, :edit, :update]

  def create
    if logged_in?
      note = current_user.notes.build(note_params)
      note.readers << current_user
      note.save
    end
    redirect_to '/'
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
