class NotesController < ApplicationController

  load_and_authorize_resource only: [:show, :edit, :destroy, :update]

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
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def edit
  end

  def update
    @note.update(note_params)
    redirect_to root_url
  end

  def show
  end

  def destroy
    @note.delete
  end

  private

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end
