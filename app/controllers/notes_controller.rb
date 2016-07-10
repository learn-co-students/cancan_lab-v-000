class NotesController < ApplicationController

  before_action :require_login

  def index
    @notes = Note.all
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.readers << current_user
    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @note = Note.new
  end

  def show
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    @note.readers << current_user
    if @note.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
  end

  def edit
    @note = Note.find(params[:id])
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path 
     end
   end

   def note_params
     params.require(:note).permit(:content, :user_id, :visible_to)
   end
end
