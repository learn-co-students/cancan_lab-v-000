class NotesController < ApplicationController
    #load_and_authorize_resource only: [:edit, :show, :update]
  def new

  end
  
  def create
    if logged_in
      @note = Note.create(notes_params)
      @note.readers << current_user
      @note.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  
  def index
      
  end
  
  def update
    @note.update(notes_params)
    redirect_to root_path
  end
  
  def destroy
  end
  
  def edit
      
  end
  
  def show
  end
  
private
  def notes_params
    params.require(:note).permit(:content,:visible_to)
  end
end
