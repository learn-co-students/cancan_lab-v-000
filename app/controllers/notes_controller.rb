class NotesController < ApplicationController
  load_and_authorize_resource  only: [:edit, :show, :update] #cancancan

  def index
    @notes = Note.none #Returns a chainable relation with zero records
    if current_user
      @notes = current_user.readable
    end
  end

  def new
    @note = Note.new
  end

  def create
    note = Note.new(note_params)
    note.user = current_user
    note.save!
    redirect_to root_path
  end

  def update
    @note = Note.find_by(id: params[:id])
    @note.update(note_params)
    redirect_to root_path
  end

  private
  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
