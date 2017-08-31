class NotesController < ApplicationController

  before_action :current_user

  def create
    @note = Note.new(note_params)
    @note.user = @user
    authorize! :create, @note
    @note.save
    redirect_to root_path
  end

  def update
    @note = Note.find_by(id: params[:id])
    authorize! :update, @note
    @note.update(note_params)
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
