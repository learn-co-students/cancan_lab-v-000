class NotesController < ApplicationController

  load_and_authorize_resource only: [:new, :create, :edit, :show, :update]
  

  def index 
  end
  def new
  end
  def create
    unless current_user.nil?
      note = Note.new(note_params)
      note.user_id = current_user.id
      note.readers << note.user
      note.save
    end
    redirect_to '/'
  end
  def edit
  end
  def update 
    note = Note.find(params[:id])
    note.update(note_params)
    note.readers << note.user
    note.save
    redirect_to '/'
  end

  private
  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
