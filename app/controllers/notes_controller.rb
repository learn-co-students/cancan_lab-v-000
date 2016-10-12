class NotesController < ApplicationController
  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  load_and_authorize_resource
  def new
    @note = Note.new
  end

  def create
    if current_user
      @note = Note.create[note_params]
      @note.user = current_user
    else
      redirect_to '/'
    end
  end

  def show
  end

  def edit
  end

  def update
    @note = Note.find(params[:id])
  end

  def delete
  end

  private
  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
