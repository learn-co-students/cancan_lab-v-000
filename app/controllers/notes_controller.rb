class NotesController < ApplicationController
  load_and_authorize_resource

  def new
    @note = Note.new
  end

  def create
    note = Note.create(note_params)
    user = User.find(session[:user_id])
    note.readers << user
    note.user = user
    note.save
    
    redirect_to root_path
  end

  def index
    @notes = Note.all
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
