class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource only: [:edit, :show, :update]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    user = current_user
    if !user
      return redirect_to root_path
    end
    note = user.notes.build(note_params)
    note.readers << user
    user.save

    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    @note.update(note_params)
    @note.readers << current_user
    @note.save
    redirect_to root_path
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private

    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end

end
