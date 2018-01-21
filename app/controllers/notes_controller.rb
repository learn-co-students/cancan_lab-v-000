class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def new
    render partial: 'form', locals: {note: Note.new}
  end

  def create
    if current_user
      note = Note.new(note_params)
      note.readers << current_user
      note.user = current_user
      note.save
    end
    redirect_to '/'
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to '/'
  end

  def edit
  end

  def show
    @note = Note.find(params[:id])
  end

  def index
    @notes = Note.none
    if current_user
      @notes = current_user.readable
    end
  end

  private

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end
