class NotesController < ApplicationController
  load_and_authorize_resource

  def create
    @note = Note.create(content: params[:note][:content], user_id: session[:user_id])
    @note.readers << current_user
    redirect_to '/'
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to '/'
  end

  def index
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
