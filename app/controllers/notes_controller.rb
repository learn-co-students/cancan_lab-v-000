class NotesController < ApplicationController
  load_and_authorize_resource only:[:index,:edit,:update]
  def index
    @notes = Note.all
  end

  def new
  end

  def create
    if logged_in?
      @note = Note.new(note_params)
      @note.user = current_user
      @note.save
    end
    redirect_to '/'
  end

  def edit
    
  end
  
  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to '/'
  end

  def show
  end

  def destroy
  end

  private
    def note_params
      params.require(:note).permit(:content, :visible_to)
    end

end