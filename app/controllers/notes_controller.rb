class NotesController < ApplicationController
  load_and_authorize_resource
  # before_action :unless_logged_in?

  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
    authorize! :create, @note
  end

  def create
    @note = Note.new(note_params)

    @note.user_id = current_user.id
    @note.save
    redirect_to notes_path(@note)
  end

  def edit
    @note = Note.find(params[:id])
    authorize! :update, @note
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to notes_path(@note)
  end

  private
  def note_params
    params.require(:note).permit(:content)
  end
end
