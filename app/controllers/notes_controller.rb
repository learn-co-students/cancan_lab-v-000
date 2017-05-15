class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update, :create, :new]

  def create
    @note.user_id = current_user.id
    current_user.notes << @note
    @note.readers << current_user
    @note.save!
    redirect_to '/'
  end

  def update
    @note.update!(note_params)
    redirect_to '/'
  end

  def index
    @notes = Note.all
    redirect_to login_path unless !!current_user
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
