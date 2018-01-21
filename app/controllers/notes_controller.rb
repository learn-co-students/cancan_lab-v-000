class NotesController < ApplicationController 
  load_and_authorize_resource 

  def index
    if current_user
      @notes = current_user.readable
    end
  end

  def new
    if logged_in?
      @note = Note.new
    else
      redirect_to '/'
    end
  end

  def create
    if logged_in?
      @note = current_user.notes.create(note_params)
      @note.readers << current_user
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end


  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
