class NotesController < ApplicationController

  def index
  end

  def new
  end
  
  def create
  	if !current_user
  		redirect_to '/'
  	else 
  	  note = Note.create(content: params[:note][:content])    	
  	  note.readers << current_user
  	  redirect_to '/'
  	end
  end

  def edit
  end

  def update
    note = Note.find_or_create_by(id: params[:id])
  	note.update(note_params)
  	redirect_to '/'
  end

  private

  def note_params
  	params.require(:note).permit(:content, :visible_to)
  end

end