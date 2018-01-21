class NotesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def create
    @note.user_reader = current_user
    @note.save
    redirect_to root_path
  end

  def update
    @note.update_attributes(note_params)
    redirect_to root_path 
  end

  private 

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
