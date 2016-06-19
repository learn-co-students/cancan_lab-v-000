class NotesController < ApplicationController

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      redirect_to '/'
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to '/'
    end
  end

  private
    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end