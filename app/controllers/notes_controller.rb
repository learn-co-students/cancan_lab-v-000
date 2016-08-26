require 'pry'
class NotesController < ApplicationController

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def index
    @notes = Note.all
  end

  def create
    authorize! :create, Note
    if session[:user_id] != nil
      note = Note.create(note_params)
      creator = User.find(session[:user_id])
      note.user_id = creator.id
      note.readers << creator
      note.save
      redirect_to '/'
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    authorize! :update, @note
    @note.update(note_params)
    @note.save
    redirect_to '/'
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
  end

  private

  def note_params
    params.require(:note).permit(:content, :user_id, :visible_to)
  end
end
