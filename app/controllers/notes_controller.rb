class NotesController < ApplicationController
  before_action :authentication_required

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    # raise params.inspect
    @note = Note.new(note_params)
    if @note.save
      redirect_to root_path
    else
      render root_path
    end
  end

  private

  def note_params
    params.require(:note).permit(:content, :user_id)
  end

end
