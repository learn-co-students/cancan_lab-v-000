
class NotesController < ApplicationController
  load_and_authorize_resource
  before_action :check_login
 
  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      redirect_to '/'
    else
      render :new
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to '/'
    else
      render :edit
    end
    
  end

  private

  def check_login
    if !logged_in? 
      redirect_to '/'
    end
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end