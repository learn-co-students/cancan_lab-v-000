class NotesController < ApplicationController
  def new
  end

  def create
    if current_user
      @note = Note.create(note_params)
      @note.readers.push(current_user)
      @note.user = current_user
    end
    redirect_to root_path
  end

  def index
  end

  def edit
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to root_path
    end
  end


  def destroy
  end

  private

  def note_params
    params.require(:note).permit([:content, :visible_to])
  end
end
