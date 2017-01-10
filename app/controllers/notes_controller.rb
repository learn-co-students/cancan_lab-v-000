class NotesController < ApplicationController

  load_and_authorize_resource only: [:edit, :show, :update]

  def new
    @note = Note.new
  end

  def create
    return redirect_to '/' unless session[:user_id]
    note = Note.new(note_params)
    note.user = current_user
    note.readers << current_user
    note.save!
    redirect_to '/'
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    return redirect_to '/' unless session[:user_id]
    note = Note.find(params[:id])
    note.update(note_params)
    redirect_to '/'
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy
    redirect_to notes_path
  end

  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  private
  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end