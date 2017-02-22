class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def index
    @notes = Note.all
  end

  def create
    if session[:user_id]
      current_user.notes.create(note_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show

  end

  def edit

  end

  def update
    Note.find(params[:id]).update(note_params)
    redirect_to root_path
  end

  def destroy

  end

  private
    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end
