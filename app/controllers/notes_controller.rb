class NotesController < ApplicationController
  load_and_authorize_resource
  def create
    current_user.notes.create(note_params)
    redirect_to root_path
  end
  def edit
  end
  def update
    @note = Note.find_by(id: params[:id])
    @note.update(note_params)
    redirect_to root_path
  end
  private
  def note_params
    params.require(:note).permit(:content, :visable_to)
  end
end
