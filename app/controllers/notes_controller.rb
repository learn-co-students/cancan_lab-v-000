class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update, :create]

  def create
    raise @user.inspect
    redirect_to '/'
  end

  def index
    @notes = Note.all
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
