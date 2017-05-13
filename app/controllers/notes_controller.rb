class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def new

  end

  def create
    n = Note.new(note_params)
    n.user = current_user
    n.save
    redirect_to '/'
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  def edit

  end

  def show

  end

  def index

  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
