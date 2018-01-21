class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    note = Note.new(note_params)
    note.user = current_user
    note.save!
    redirect_to root_path
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
  end

  def update
    @note.update(note_params)
    redirect_to root_path
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end