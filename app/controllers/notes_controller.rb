class NotesController < ApplicationController
  load_and_authorize_resource

  def create
    @note.user = current_user
    @note.save!
    @note.readers << current_user
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    @note.update!(note_params)
    @note.readers << current_user
    redirect_to root_path
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
