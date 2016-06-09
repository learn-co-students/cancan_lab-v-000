class NotesController < ApplicationController
  def index
  end

  def new
  end

  def create
    if session[:user_id]
      user = User.find(session[:user_id])
      user.notes.build(note_params)
      user.save
      redirect_to "/"
    else
      redirect_to "/"
    end
  end

  def edit
  end

  def update
    if session[:user_id]
      user = User.find(session[:user_id])
      note = Note.find(params[:id])
      note.update(note_params)
    end
    redirect_to "/"
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
