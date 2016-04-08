class NotesController < ApplicationController
  load_and_authorize_resource except: [:index]
  
  def index 
    @notes = []
    @notes = current_user.readable if current_user
  end
  
  def create 
    @note = Note.new(note_params)
    if @note.valid?
      @note.user = current_user
      @note.save!
      redirect_to root_path
    else
      render :new 
    end
  end 
  
  def update 
    if @note.update(note_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private 
  
  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
  
end
