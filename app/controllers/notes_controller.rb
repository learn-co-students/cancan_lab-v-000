class NotesController < ApplicationController
 load_and_authorize_resource only: [:edit, :show, :update]
  before_action :set_note, only: [:edit, :show, :destroy, :update]

  def new
    if logged_in?
      @note = Note.new
    else
      redirect_to login_path
    end
  end

  def create
    note = Note.new(note_params)
    note.user = current_user
    note.save!
    redirect_to '/'
  end

  def edit
  end

  def update
    @note.update(note_params)
    redirect_to '/'
  end

  def index
    @notes = Note.none
    if current_user
      @notes = current_user.readable
    end
  end

  def destroy
  end

  def show
  end

  private
    def set_note
      @note = Note.find_by(id: params[:id])
    end

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end
