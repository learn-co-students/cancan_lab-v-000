class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :update, :show]
  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save!
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
    @note.update(note_params)
    redirect_to '/'
  end

  def destroy

  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
