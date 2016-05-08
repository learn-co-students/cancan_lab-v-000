class NotesController < ApplicationController
  before_action :require_logged_in
  load_and_authorize_resource
  skip_authorize_resource only: :create
  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.readers << current_user
    if @note.save
      redirect_to '/'
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    if @note.save
      redirect_to '/'
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    flash[:notice] = "Note was deleted."
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
