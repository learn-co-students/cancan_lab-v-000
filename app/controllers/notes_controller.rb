class NotesController < ApplicationController
  load_and_authorize_resource

  def index
    @notes = Note.all 
  end
  
  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
      if @note.save
        redirect_to root_path
      end
  end

  def edit
  end 

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to root_path
  end

  def show
    @note = Note.find(params[:id])
  end 


  private 

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end