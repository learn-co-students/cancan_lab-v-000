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
    note = Note.find_by(id: params[:id])
  	note.update(content: params[:note][:content])
  	new_readers = params[:note][:visible_to].split(", ")
  	new_readers.each do |reader|
  		r = User.find_or_create_by(name: reader)
  		note.readers.unshift(r)
  		r.save
  		binding.pry
  	end
  	binding.pry
    redirect_to '/'
  end

  private

  def note_params
  	params.require(:note).permit(:content, :visible_to)
  end

end