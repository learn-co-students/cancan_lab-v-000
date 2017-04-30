class NotesController < ApplicationController
  load_and_authorize_resource

  def index

  end

  def new
    @note = Note.new
  end

  def create
    note = Note.new(note_params)
    note.save
    note.readers << note.user
    redirect_to note_path(note)
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to note_path(@note)
  end


  private

  def note_params
    params.require(:note).permit(:content, :visible_to, :user_id)
  end

end
