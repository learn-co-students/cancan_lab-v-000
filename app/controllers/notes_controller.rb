require 'pry'
class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create

    if current_user
      note = current_user.notes.build(note_params)

      if note.save
        redirect_to root_path
      else
        render :new
      end
    else
      redirect_to root_path
    end
  end

  def update
    @note = Note.find_by(id: params[:id])
    @note.update(note_params)
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
