class NotesController < ApplicationController
load_and_authorize_resource
rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def new
    @note = Note.new
    @note.readers.build
  end

  def create
    @note = Note.create(note_params)
    @note.user = current_user
    @note.readers << current_user
    redirect_to root_path
  end

  def show
    @note = Note.find_by(id: params[:id])
  end

  def index
  end

  def update
    @note = Note.find_by(id: params[:id])
    @note.update(note_params)
    @note.readers << current_user
    redirect_to root_path
  end

private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end


end
