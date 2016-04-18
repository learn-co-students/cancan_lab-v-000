class NotesController < ApplicationController
  load_and_authorize_resource

  def index
    @notes = Note.all
  end

  def new
    if current_user
      render partial: 'form', locals: {note: Note.new}
    else
      redirect_to '/login'
    end
  end

  def create
    note = Note.new(note_params)
    note.user = current_user
    note.save!
    redirect_to '/'
  end

  def edit
    if current_user
      render partial: 'form', locals: {note: Note.new}
    else
      redirect_to '/login'
    end
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  private
  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
