require 'pry'

class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def new
    @note = Note.new
  end 

  def index
    @notes = Note.all
  end
  
  def create
    note = Note.new(note_params)
    note.user = current_user
    if note.save
      redirect_to root_path  
    else
      redirect_to new_note_path  
    end 
  end
    
  def show
  end

  def edit
  end

  def update
    note = Note.find(params[:id])
    note.update(note_params)
    redirect_to root_path
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
  end 

  private
    def note_params
      params.require(:note).permit(:content, :visible_to)
    end 
end
