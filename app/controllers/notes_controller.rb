require 'pry'
class NotesController < ApplicationController
load_and_authorize_resource only: [:show, :edit, :update]

  def index
    @user = current_user
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    if current_user
      @note = Note.new(note_params)

      if @note.save
        @note.user = current_user
        @note.readers << current_user
        @note.save
        redirect_to root_path
      else
        redirect_to new_note_path
      end
    else
      redirect_to root_path
    end
  end

  def show
    @note = Note.find_by_id(params[:id])
  end

  def edit
  end

  def update
    @note = Note.find_by_id(params[:id])
    @note.update(note_params)
    @note.readers << current_user
    @note.save
    redirect_to root_path
  end





private





  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
