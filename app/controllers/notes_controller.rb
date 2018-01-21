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
    render partial: 'form', locals: {note: Note.new}
  end

  def create
    if logged_in?
      current_user
      @user.notes.create(note_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if logged_in?
      current_user
      @note.update(note_params)
      redirect_to root_path
    end
  end

  def destroy
  end


  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
