class NotesController < ApplicationController
  def index
  end

  def new
    @note = Note.new
    @note.viewers.build
  end

  def show
  end

  def create
    note = Note.new(note_params)
    if note.save
      redirect_to '/'
    end

  end

  def edit

  end

  def update

  end

  def destroy

  end
  private

  def note_params
    params.require(:note).permit(:content, visible_to:[])
  end

end
