class NotesController < ApplicationController

  def index
  end

  def show
    @note = Note.find(id: params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    if logged_in?
      current_user
      @user.notes.create(note_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if logged_in?
      current_user
      Note.find(params[:id]).update(note_params)
      redirect_to root_path
    end
  end

  def destroy
  end


  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
