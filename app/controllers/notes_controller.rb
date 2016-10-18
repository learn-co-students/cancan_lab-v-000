class NotesController < ApplicationController
  def index
  end

  def new
    @note = Note.new
    # @note.viewers.build
  end

  def show
    @note = Note.find(params[:id])
  end

  def create

      note = Note.new(note_params) if require_login
      if !note.nil?
        note.save
        redirect_to '/'
      else
        redirect_to controller: 'notes', action: 'index'
      end
  end


  def edit

  end

  def update

  end

  def destroy

  end
  private

  def note_params
    params.require(:note).permit(:content, visible_to:[])
  end

end
