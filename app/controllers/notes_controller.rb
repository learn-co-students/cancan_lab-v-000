class NotesController < ApplicationController
  
  def new

  end

  def index
    if Note.all != []
      @notes = Note.all
    else
      @message = "There are no notes here"
    end
  end

  def create
      @note = Note.new(note_params)
      @note.user = current_user
      @note.save
      redirect_to '/' 
  end

  def show
  end

  def edit
  end

  def update
      @note = Note.find_by(id: params[:id])
      @note.update(note_params)
      redirect_to '/'
  end

  def destroy
  end

  private 

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
