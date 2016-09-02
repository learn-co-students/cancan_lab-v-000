class NotesController < ApplicationController
  load_and_authorize_resource

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.create(note_params)
    @note.user = current_user
    @note.readers << current_user
    redirect_to root_path
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
    @note.readers << current_user
    redirect_to root_url
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
