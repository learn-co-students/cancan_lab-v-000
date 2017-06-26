class NotesController < ApplicationController
  def new
    @note = Note.new()
  end

  def create
    @note = Note.create(note_params)
    redirect_to note_path(@note)
  end

  def show
    @note = Note.find(params[:id])
    authorize! :read, @note
  end

  def index
    @notes = Note.all
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to note_path(@note)
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:content,:user_id,
      readers_attributes:[:name]
    )
  end
end
