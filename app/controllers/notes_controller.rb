class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def index
  end

  def new
  end

  def create
    if can? :create, Note
      note = Note.new(note_params)
      note.readers << current_user
      note.save
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def edit
  end

  def update
      @note.update(note_params)
      redirect_to '/'
  end

  def show
  end

  def destroy
  end


    private

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end

end
