class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user

    if @note.save
      redirect_to '/'
    else
      redirect_to controller: 'notes', action: 'new'
    end
  end

  def edit
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  def destroy
    @note.destroy
    redirect_to '/'
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
