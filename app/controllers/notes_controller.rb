class NotesController < ApplicationController
  #load_and_authorize_resource

  def new
  end

  def create
    @note = Note.create(params.require(:note).permit(:content, :visible_to))
    authorize! :create, @note
    @note.viewers.create(user_id: current_user.id)
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @notes = Note.all
  end
end
