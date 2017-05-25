class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(create_note_params)
    @note.user = current_user
    @note.save
    redirect_to '/'
  end

  def update
    @note.update(create_note_params)
    redirect_to '/'
  end


  private

  def create_note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
