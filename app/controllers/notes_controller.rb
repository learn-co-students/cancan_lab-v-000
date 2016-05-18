class NotesController < ApplicationController
  load_and_authorize_resource

  def index
    @notes = Note.all
  end

  def show
    set_note
  end

  def new
    @note = Note.new
  end

  def create
    current_user.notes.create(note_params)
    redirect_to notes_path
  end

  def edit
    set_note
  end

  def update
    Note.find(params[:id]).update(note_params)
    redirect_to notes_path
  end

  def destroy
    set_note
    @note.destroy
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
