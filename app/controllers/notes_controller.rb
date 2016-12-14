class NotesController < ApplicationController
  def index
    if logged_in?
      @notes = current_user.readable
      raise
    else
      redirect_to "/"
    end
  end

  def new
    if logged_in?
      @note = Note.new
    else
      redirect_to "/"
    end
  end

  def create
    if logged_in?
      note = Note.new(get_params)
      note.user = current_user
      note.readers << current_user
      note.save
      # redirect_to note_path(note)
      redirect_to "/"
    else
      redirect_to "/"
    end
  end

  def show
    if logged_in?
      @note = Note.find(params[:id])
    else
      redirect_to "/"
    end
  end

  def edit
    if logged_in?
      @note = Note.find(params[:id])
    else
      redirect_to "/"
    end
  end

  def update
    note = Note.find(params[:id])
    if logged_in?
      note.update(get_params)
      note.readers << current_user
      note.save
      # redirect_to note_path(note)
      redirect_to "/"
    else
      redirect_to "/"
    end
  end

  def destroy
    Note.find(params[:id]).delete
    redirect_to notes_path
  end

  private

  def get_params
    params.require(:note).permit(
      :content,
      :visible_to
    )
  end
end
