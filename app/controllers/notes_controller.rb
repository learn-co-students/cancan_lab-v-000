class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destory]

  load_and_authorize_resource

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.save
    redirect_to '/'
  end

  def show
  end

  def edit
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to '/'
    else
      render :edit
    end
  end

  def destroy
    @note.destory
    redirect_to notes_path
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
