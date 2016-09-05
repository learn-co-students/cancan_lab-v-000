class NotesController < ApplicationController
  # load_and_authorize_resource
  before_action :redirect_unless_logged_in?

  def index
    @notes = Note.all
  end

  def new
  end

  def create
    @note = Note.create(note_params)
    @note.readers << current_user
    redirect_to '/'
  end

  def edit
  end

  def update
    @note = Note.find_by(id: params[:id])
    @note.update(note_params)
    new_user = User.find_by(name: note_params[:visible_to])
    @note.readers = [new_user]
    @note.readers << current_user
    redirect_to '/'
  end

  def show
  end

  def destroy
  end

  private

  def redirect_unless_logged_in?
    redirect_to '/' unless session[:user_id]
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

  def current_user
    @user = User.find_by(id: session[:user_id])
  end
end
