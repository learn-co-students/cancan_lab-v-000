class NotesController < ApplicationController
  #before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :require_authentication
  load_and_authorize_resource

  def index
    @notes = current_user.readable | current_user.notes
  end

  def show
  end

  def new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      redirect_to root_path, notice: "Successfully created note"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to root_path(@note), notice: "Successfully updated note"
    else
      render 'new'
    end
  end

  def destroy
    if @note.delete
      redirect_to root_path, notice: "Succesfully deleted note"
    else
      redirect_to root_path(@path), notice: "Can't deleted note"
    end
  end

  private

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end

    def set_note
      @note = Note.find_by(id: params[:id])
    end
end
