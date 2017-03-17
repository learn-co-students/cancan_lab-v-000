class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    if logged_in?
      note = Note.new(note_params)
      redirect_to note_path(note)
    else
      redirect_to "/"
    end
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end

end
