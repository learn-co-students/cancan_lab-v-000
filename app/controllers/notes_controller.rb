class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]
  

  def new
    @note = Note.new
  end


    def create
    note = Note.new(note_params)
    note.save!
    redirect_to '/'
  end

  def show
    end

  def edit

  end

  def update
    note.update(note_params)
    note.save!
    redirect_to '/'
  end

  def delete
  end

  private
  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
