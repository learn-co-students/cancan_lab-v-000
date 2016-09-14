class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def index
    @notes = Note.none
    if current_user
      @notes = current_user.readable
    end
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    note = Note.new(note_params)
    if note.present?
      note.user = current_user
      note.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @note = Note.find_by(id: session[:user_id])
  end

  def update
    @note.update(note_params)
    redirect_to root_path
  end

  private

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end

end
