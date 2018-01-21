class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource only: [:edit, :show, :update]


  def index
   @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    note = Note.new(note_params)
    note.user = current_user
    note.save!
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    @note.update(note_params)
    redirect_to root_path
  end

  def destroy
    @note.destroy
  end

private

  def find_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
