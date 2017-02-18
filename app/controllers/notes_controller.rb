class NotesController < ApplicationController
  load_and_authorize_resource

  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
      @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    @note.user_id = current_user.id
    @note.save
    redirect_to note_path(@note)
  end

  def edit
    @note = Note.find(params[:id])
  end

  private
  def note_params
    params.require(:note).permit(:content)
  end
end
