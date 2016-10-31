class NotesController < ApplicationController
  def create
    if logged_in?
      user = User.find(session[:user_id])
      note = user.notes.create(note_params)
      redirect_to note_path(note)
    else
      redirect_to '/'
    end
  end

  def index
    @notes = Note.all
    render :index
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
