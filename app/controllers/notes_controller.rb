class NotesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create    
    
    unless current_user.nil?
      note = Note.create(note_params)
      note.user = current_user
      note.save
      note.readers << current_user
    end
    
    redirect_to root_path
  end

  def edit
  end

  def update
    note = Note.find(params[:id])
    note.update(note_params)
    note.readers << current_user
    
    redirect_to root_path    
  end

  def destroy
  end
  
  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
