class NotesController < ApplicationController
  load_and_authorize_resource

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
  end

  def show
    @note = Note.find_by(note_params)
  end

  def edit
    @note = Note.find_by(note_params)
  end

  def update
    @note = Note.find_by(note_params)
  end

  def destroy
    @note = Note.find_by(note_params)
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
