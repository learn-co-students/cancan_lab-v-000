class NotesController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: [:index]

  def index
    if current_user
      @notes = current_user.readable
    else
      @notes = []
    end
  end

  def new
    @note =  Note.new
  end

  def create
    note = Note.new(note_params)
    note.user = current_user
    note.readers << current_user
    if note.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    note = Note.find_by(id: params[:id])
    if note.update(note_params)
      note.readers << current_user
      note.save
      redirect_to root_path
    else
      render 'edit'
    end
  end




  private
    def note_params
      params.require(:note).permit(:content, :visible_to)
    end

end
