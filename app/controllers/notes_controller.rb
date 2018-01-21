class NotesController < ApplicationController
  load_and_authorize_resource

  def index
    @notes = Note.none
    if current_user
      @notes = current_user.readable
    end
  end

  def new
    @note = Note.new
  end

  def create
    note = Note.new(note_params)
    if current_user
      note.user = current_user
      note.save
    end
    redirect_to root_path
  end

  def edit
    @note = Note.find_by(id: params[:id])
  end

  def update
    note = Note.find_by(id: params[:id])
    if note.user == current_user
      note.readers.clear
      note.update(note_params)
    end
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
