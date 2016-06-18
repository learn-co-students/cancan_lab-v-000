class NotesController < ApplicationController
  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to @note
    end
  end

  private
    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end