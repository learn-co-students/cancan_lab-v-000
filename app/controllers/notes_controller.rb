class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]
  before_action :require_login

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
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

  def edit
    @note = Note.find[params[:id]]
  end

  def update
    @note.update(note_params)
    @note.readers << current_user
    if @note.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:content, :user_id, :visible_to)
  end

   def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path 
    end
  end


end