class NotesController < ApplicationController

  before_action :find_note, only: [:show, :edit, :update, :destroy]
  
  def new
    #if logged_in?
      @note = Note.new
    #else
      #redirect_to login_path
    #end
  end
  
  def index
    @notes = Note.all
  end
  
  def create
    
      note = Note.new(note_params)
      note.user = current_user
         note.save!
        redirect_to root_path
      
  end
  
  def show

  end

  def edit
  end

  def update
    @note.update(note_params)
    redirect_to root_path
  end

  def destroy
  end
    


  private
  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

  def find_note
    @note = Note.find_by(id: params[:id])
  end

end
