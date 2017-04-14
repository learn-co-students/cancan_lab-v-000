class NotesController < ApplicationController
  load_and_authorize_resource

  def create
    redirect_to '/' if !logged_in?
    current_user.notes.new(note_params).save
    redirect_to '/'
  end

  def update
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
