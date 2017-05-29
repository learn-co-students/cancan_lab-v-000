class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]
  
  def new
   @note = current_user.notes.build
  end

  def create
    if current_user
      note = Note.new(note_params)
      note.user = current_user
      note.add_owner_to_readers(current_user)
      note.save!
    end
    redirect_to '/'
  end

  def show
    @note = Note.find_by(id: params[:id])
  end
  
  def index
    @notes = []
    if current_user
      @notes = current_user.readable
    end
  end

  def edit
    if current_user
      @note = Note.find_by(id: params[:id])
    end
  end

  def update 

    @note = Note.find_by(id: params[:id])
    @note.update(note_params)
    @note.add_owner_to_readers(current_user)

    redirect_to '/'
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end