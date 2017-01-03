class NotesController < ApplicationController

	  load_and_authorize_resource only: [:show, :edit, :update]

  
  def show
  end

  def index
  end

  def new
    @note = Note.new
  end


  def create
    if logged_in?
      note = Note.new(note_params)
      note.user = current_user
      note.readers << current_user
      note.save!
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    note = Note.find_by(id: params[:id])
    if logged_in?
      
      note.update(note_params) if note.user == current_user
      note.save

      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
