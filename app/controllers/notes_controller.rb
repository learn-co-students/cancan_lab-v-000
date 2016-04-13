class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    authorize! :read, @note
  end

  def new
    @note = Note.new
  end

  def create
    if logged_in?
      @note = current_user.notes.build(note_params)
      @note.readers << current_user
      if @note.save
        redirect_to root_path
      else
        redirect_to new_note_path, alert: "Problem creating note."
      end
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    authorize! :update, @note
    @note.update(note_params)
    if @note.save
      redirect_to root_path
    else
      redirect_to edit_note_path(@note)
    end
  end

  def destroy
    @note.destroy
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

  def find_note
    @note = Note.find_by(id: params[:id])
  end

end
