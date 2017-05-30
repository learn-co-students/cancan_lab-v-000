class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def new
    @note = Note.new
  end

  def create
    if current_user
      @note = Note.create(note_params)
      @note.user = current_user
      @note.save
    end
    redirect_to '/'
  end

  def index
    @notes = Note.all
  end

  def edit
  end

  def show
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  private

  def note_params
    params.required(:note).permit(:content, :visible_to)
  end
end
