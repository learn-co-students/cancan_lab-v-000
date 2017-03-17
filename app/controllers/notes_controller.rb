class NotesController < ApplicationController
  load_and_authorize_resource

  def new
  end

  def create
    if logged_in?
      note = current_user.notes.create(note_params)
      note.readers << current_user
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to '/'
    else
      render :edit
    end 
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
