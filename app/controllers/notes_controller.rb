class NotesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    current_user.notes.create(note_params)
    redirect_to root_path
  end

  def edit
  end

  def update
    Note.find_by(id: params[:id]).update(note_params)
    redirect_to root_path
  end


  def note_params
    params.require(:note).permit(:content, :visible_to)
  end


end
