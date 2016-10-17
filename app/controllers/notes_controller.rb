class NotesController < ApplicationController
  load_and_authorize_resource only: [:show, :edit, :update, :new]
  before_action :set_note, only: [:show, :edit, :update, :delete]
  before_action :logged_in?

  def index
    @notes = Note.all
    if current_user
      @notes = current_user.readable
    end
  end

  def new
    @note = Note.new
    @viewer = @note.viewers.build
  end

  def create
    note = Note.new(note_params)
    note.user = current_user
    note.save
    redirect_to '/'
  end

  def show
  end

  def edit
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private
  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

  def set_note
    @note = Note.find_by(id: params[:id])
  end
  
end
