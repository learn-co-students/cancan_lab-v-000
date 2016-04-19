class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.save
    redirect_to root_path
  end

  def index
  end

  def edit
  end

  def update
    @note = Note.find_by(id: params[:id])
    @note.update(note_params)
    redirect_to root_path
  end

  def destroy
  end


  private

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end

end
