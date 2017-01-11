require 'pry'

class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :update, :show, :destroy]

  def index
    if !logged_in?
      redirect_to login_path
    else
      @notes = Note.all
      binding.pry
    end
  end

  def new
    @note = Note.new
  end

  def create
    if current_user
      @note = Note.new(note_params)
      @note.save
    end
    redirect_to root_path
  end

  def show

  end

  def edit
  end

  def update
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
