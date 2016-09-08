class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def index
    @notes = Note.all
    if current_user
      @notes = current_reader.readable
    end
  end


  def new
    @note = Note.new
  end

  def create
    note = Note.create(note_params)
    note.user = current_user
    binding.pry
    note.readers << current_user
    note.save!
    
    redirect_to '/'
  end

  def edit
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  def index
    @notes = Note.all
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
