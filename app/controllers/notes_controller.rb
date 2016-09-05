class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def index
    current_user ? @notes = current_user.readable : @notes = []
  end

  def new
    render partial: 'form', locals: {note: Note.new}
  end

  def create
    note = Note.new(note_params)
    note.user = current_user
    if note.save
      redirect_to '/'
    else
      render :new
    end
  end

  def show
  end

  def edit
    render partial: 'form', locals: {note: @note}
  end

  def update
    @note.update(note_params)
    if @note.save
      redirect_to '/'
    else
      render :edit
    end
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
