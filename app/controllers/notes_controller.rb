class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)
    if @note.user = current_user
      @note.save
    end
    redirect_to '/'
  end

  def update
    @note = Note.find(params[:id])
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