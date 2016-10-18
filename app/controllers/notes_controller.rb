class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def create
    if current_user
      note = Note.new(note_params)
      note.readers << current_user
      note.save
    end
    redirect_to '/'
  end

  def update
    note = Note.find(params[:id])
    note.update(params[:note])
    redirect_to '/'
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
