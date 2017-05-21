class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]
  
  def new
   @note = current_user.notes.build
   authorize! :new, @note
  end

  def create
   
    if current_user
      note = current_user.notes.create(note_params)
      binding.pry
      redirect_to note_path(note)
      authorize! :create, note
    else
      redirect_to '/'
    end
  end

  def show
    @note = Note.find_by(id: params[:id])
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
