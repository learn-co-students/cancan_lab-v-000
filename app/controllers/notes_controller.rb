class NotesController < ApplicationController
  load_and_authorize_resource

  def create
    current_user.notes.create(note_params) if logged_in?
    redirect_to '/'
  end

  def update
    Note.find(params[:id]).update(note_params)
    redirect_to '/'
  end

  private

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end
