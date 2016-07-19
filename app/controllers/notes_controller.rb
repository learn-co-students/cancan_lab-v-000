class NotesController < ApplicationController
  before_action :set_note!, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:index]
  
  def index
  end
  
  def show
  end
  
  def new
    @note = Note.new
  end
  
  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    @note.update(note_params)
    if @note.valid?
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
  end
  
  private
  
  def set_note!
    @note = Note.find(params[:id])
  end
  
  def note_params
    params.require(:note).permit(:content, :user_id, :visible_to)
  end
end
