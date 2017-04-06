class NotesController < ApplicationController
  #load_and_authorize_resource

  def show
  end

  def new
  end

  def create
    if logged_in?
      if current_user.notes.create(note_params)
        redirect_to '/'
      end
    else
      redirect_to '/'
    end
  end

  def update
    # binding.pry
    if logged_in?
      @note = Note.find_by_id(params[:id])
      @note.update(note_params)
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
