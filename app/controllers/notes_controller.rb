class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def index
  end

  def create
    note = Note.new(note_params)
    note.user = current_user
    note.save!
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end

end
