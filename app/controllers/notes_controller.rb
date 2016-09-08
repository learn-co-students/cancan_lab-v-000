class NotesController < ApplicationController
  def create
    note = Note.create(note_params)
    redirect_to root_path
  end

  def index
    @notes = Note.all
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
