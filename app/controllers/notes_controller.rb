class NotesController < ApplicationController

  def index
    @notes = Note.all
  end

  def show
    @note = Note.find_by(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.create(note_params)
    redirect_to note_path(@note)
  end

  def edit
    @note = Note.find_by(params[:id])
  end

  def update
    @note = Note.find_by(params[:id])
    @note.update(note_params)
    redirect_to note_path(@note)
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
