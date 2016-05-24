class NotesController < ApplicationController
  load_and_authorize_resource

  def index
    @notes= Note.all

  end

  def create
    if logged_in?
      note = Note.create(note_params)
      note.readers << current_user
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def update

    if logged_in?

        @note.update(note_params)
      redirect_to root_path
    else
      redirect_to root_path
    end

  end


  def new

  end

  def show

  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to, :user_id, :readers)
  end

end
