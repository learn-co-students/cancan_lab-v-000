class NotesController < ApplicationController
  load_and_authorize_resource
  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to '/'
    else
      render :new
    end

  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
    @note = Note.find(params[:id])
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

  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
