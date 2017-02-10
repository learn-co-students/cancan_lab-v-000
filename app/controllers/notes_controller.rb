class NotesController < ApplicationController

  load_and_authorize_resource

  def index
    @notes = Note.all
  end

  def create
    @note = current_user.notes.new(note_params)
    @note.readers << @note.user
    if @note.save
      redirect_to root_path
    else
      redirect_to new_note_path
    end
  end

  def new

  end

  def edit

  end

  def show
    @note = Note.find_by_id(params[:id])
  end

  def update
    @note.readers.clear
    @note.update(note_params)
    @note.readers << @note.user
    redirect_to root_path
  end

  def destroy

  end

  private
  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
