class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def index
    @notes = Note.all
  end

  def show
    @note = Note.find_by(id: params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.save!
    redirect_to '/'
  end

  def edit
    @note = Note.find_by(id: params[:id])
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  def destroy
    @note.destroy
    redirect_to '/login'
  end

  private
  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
