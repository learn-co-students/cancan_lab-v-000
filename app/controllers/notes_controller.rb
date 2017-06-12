class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update]
  load_and_authorize_resource

  def new
  end

  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @note.update(note_params)
    @note.save
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

  def set_note
    @note = Note.find_by(id: params[:id])
  end
end
