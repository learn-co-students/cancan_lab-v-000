class NotesController < ApplicationController
  def create
    if can? :create, Note
      @note = Note.create(note_params)
      @note.update(user_id: session[:user_id])
      @viewer = Viewer.create(user_id: session[:user_id], note_id: @note.id)
    end
    redirect_to '/'
  end

  def update
    @note = Note.find_by(id: params[:id])
    if can? :update, @note
      @note.update(note_params)
    end
    redirect_to '/'
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
