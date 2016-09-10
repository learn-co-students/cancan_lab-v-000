class NotesController < ApplicationController
  def new
    @note = Note.new
  end

  def create
    @note = Note.create(note_params) if logged_in?
    redirect_to '/'
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to => {})
  end
end
