class NotesController < ApplicationController
  load_and_authorize_resource
 
  def index
  end
 
  def new
    @note = Note.new
  end
 
  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.save
    redirect_to root_path
  end
 
  def show
    @note = Note.find(id: params[:id])
  end

  def edit
    @note = Note.find(id: params[:id])
  end

  def destroy
    @note = Note.find(id: params[:id])
    @note.destroy
    redirect_to root_path
  end
 
  def update
    @note.update(note_params)
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end