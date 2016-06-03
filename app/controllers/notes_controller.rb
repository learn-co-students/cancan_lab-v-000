class NotesController < ApplicationController
  

  def index

  end

  def new

  end

  def create
     
    if session[:user_id]
 
      note = Note.new(notes_params)
      note.user = current_user
      note.save
   
    else
    
    end
    redirect_to '/'

  end

  def show

  end

  def edit

  end

  def update
    binding.pry
    @note = Note.find(params[:id])
    @note.update(notes_params)
    binding.pry
    redirect_to '/'
  

  end


  def destroy

  end

  private

  def notes_params
    params.require(:note).permit(:content, :visible_to)
  end



end