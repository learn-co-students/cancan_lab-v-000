class NotesController < ApplicationController
  load_and_authorize_resource
  def new
    @note = Note.new
  end

  def create
      note = Note.new(note_params)
      note.user = current_user
      note.save
      redirect_to '/'
  end

  def show
    @note = Note.find(id: params[:id])

  end

  def index
  end

  def edit
    @note = Note.find(id: params[:id])

  end

  def update
    note = Note.find_by(id: params[:id])
    note.update(note_params)
    redirect_to '/'
  end

  def destroy
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
