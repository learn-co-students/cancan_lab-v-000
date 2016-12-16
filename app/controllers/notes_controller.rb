class NotesController < ApplicationController
  before_action :authentication_required

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    # raise current_user.inspect
    @note = Note.create(note_params)
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(:content, :user_id)
  end

end
