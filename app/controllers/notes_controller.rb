class NotesController < ApplicationController

  before_action :set_note, only: [:edit, :update]
  load_and_authorize_resource only: [:edit, :show, :update]

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.save
    redirect_to '/'
  end

  def edit
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end
