class NotesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.save!
    redirect_to '/'
  end

  def edit
    @note = Note.find_by(id: params[:id])
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  def destroy
  end

  private
  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
