class NotesController < ApplicationController
  load_and_authorize_resource

  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
    authorize! :read, @note
  end

  def new
    @note = Note.new
    authorize! :create, @note
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.save

    redirect_to root_path
  end

  def edit
    @note = Note.find(params[:id])
    authorize! :update, @note
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)

    redirect_to root_path
  end

private 
  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
