class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
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
  end

  def update
    if @note.update(note_params)
      redirect_to '/'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private

  def set_note
    @note = Note.find_by(id: params[:id])
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
