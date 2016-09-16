class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def new
    @note = Note.new
  end

  def create
    note = Note.new(note_params)
    if note.save
      redirect_to :root
    else
      render new
    end
  end
 
  def index
  end

  def show
    @note = Note.find_by(params[:id])
  end

  def update
    @note = Note.find_by(params[:id])
    @note.update(note_params)
    redirect_to :root
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
