class NotesController < ApplicationController
  load_and_authorize_resource only: [:new, :create, :update]

  def new

  end
  
  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.save!
  
    redirect_to '/'
  end

  def update
    
    @note.update(note_params) 
    redirect_to '/'
  end
  
  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end  
  
end
