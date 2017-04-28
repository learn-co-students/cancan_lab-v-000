class NotesController < ApplicationController
 load_and_authorize_resource only: [:edit, :show, :update]

  def home

  end

  def index
    @notes = Notes.all
  end

  def new

  end

  def create
    if logged_in?

      @note = Note.new(note_params)
      @note.user = current_user
      @note.save
     redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show

  end

  def edit

  end


  def update
    if logged_in?
      note = Note.find_by(id: params[:id])
      note.update(note_params)
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
