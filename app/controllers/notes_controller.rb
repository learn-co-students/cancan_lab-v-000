class NotesController < ApplicationController
  load_and_authorize_resource only: [:show]

  def new
  end

  def create
    if logged_in?
      @note = Note.create(note_params)
      @note.readers << current_user
      @note.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if logged_in?
      @note = Note.find_by_id(params[:id])
      @note.update(note_params)
      @note.readers << current_user if !@note.readers.include?(current_user)
      @note.save

      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
  end

  def index
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
