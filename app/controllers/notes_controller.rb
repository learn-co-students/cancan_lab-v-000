class NotesController < ApplicationController
  load_and_authorize_resource
  
  def create
    @note = Note.create(note_params)
    @note.readers << current_user
    @note.user = current_user
    @note.save
    redirect_to "/"
  end
  
  def update
    @note.update(note_params)
    @note.readers << current_user
    @note.readers.each {|x| puts x.name}
    @note.save
    redirect_to "/"
  end
  
  def note_params
    params.require(:note).permit(:user_id, :content, :visible_to)
  end
  

end
