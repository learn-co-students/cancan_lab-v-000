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
    if logged_in?
      note = Note.create(note_params)
      note.user = current_user
      note.readers << current_user
      note.save!
    end
      redirect_to '/'
  end

  def edit
  end

  def update
    @note.update(note_params)
    @note.readers = @note.readers.sort
    # binding.pry
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
