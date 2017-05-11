class NotesController < ApplicationController
  before_action :set_note, only: [:update]
  load_and_authorize_resource


  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    if logged_in?
      note = current_user.notes.create(note_params)
      note.readers << current_user
    end
    redirect_to '/'
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content, :visible_to, :user_id)
  end
end
