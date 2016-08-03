class NotesController < ApplicationController
  
  load_and_authorize_resource only: [:update]

  #figures out from name of controller, what resource is loaded and authorized. 
  # for index it will do @notes = Notes.all for you. 

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(notes_params)
    @note.user = current_user
    @note.save!
    redirect_to '/'
  end  


  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(notes_params)
    redirect_to '/'
  end


  def show
  end

  def index
  end

  def destroy
    @note = Note.find(params[:id])
  end

  #load_and_authorize_resource param_method: :notes_params
  ## need to have visible_to in the params as well. 


  def notes_params
    params.require(:note).permit(:content, :visible_to)
  end

  #create_params - will build the object for you in the create method. 
  #we will need to set the current user. current_user 
end
