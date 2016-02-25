class NotesController < ApplicationController
  #load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if can? :create, Note
      note = Note.create(note_params)
      note.user = current_user
      note.readers << note.user
      #binding.pry
      note.save
    end
    redirect_to '/'
  end

  def show

  end

  def edit
  end

  def update
    note = Note.find(params[:id])
    if can? :update, note
      note.update(note_params)
      note.save
    end
    redirect_to '/'
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
