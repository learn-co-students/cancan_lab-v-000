class NotesController < ApplicationController
  #load_and_authorize_resource

  def new
  end

  def create
    authorize! :create, Note
    @note = Note.create(note_params)
    @note.viewers.create(user_id: current_user.id)
    redirect_to root_path
  end

  def edit
  end

  def update
    authorize! :update, Note
    @note = Note.find_by(id: params[:id])
    #@note.readers.clear
    @note.update(note_params)
    #@note.viewers.create(user_id: current_user.id)
    #byebug
    redirect_to root_path
  end

  def destroy
  end

  def index
    @notes = Note.all
  end

private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
