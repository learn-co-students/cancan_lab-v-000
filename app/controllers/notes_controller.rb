class NotesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    @note = Note.new(note_params)
    if current_user
      @note.user = current_user
      @note.save
      redirect_to '/'
    else
      redirect_to root_path
    end
  end

  def show
  end

  def edit
  end

  def update
      @note.update!(note_params)
      redirect_to root_path
  end

  def destroy
    @note = Note.find_by(params[:id])
    if current_user == @note.user
      @note.delete
      redirect_to root_path
    end
  end

private

def note_params
  params.require(:note).permit(:content, :visible_to)
end


end
