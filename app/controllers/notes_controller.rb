class NotesController < ApplicationController
  load_and_authorize_resource

  def create
    @note = Note.new(note_params) #if logged_in?
    @note.user = current_user
    @note.save
    redirect_to '/'
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end

#@note.readers << note_params[:visible_to].each {|user| User.find_by(name: user)}
