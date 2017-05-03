class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :update, :show]
  
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      redirect_to '/'
    end
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  def edit
  end

  def show
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end