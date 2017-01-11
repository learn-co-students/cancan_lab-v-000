class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :update, :show, :destroy]
  before_action :current_user

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    if current_user
      @note = Note.new(note_params)
      @note.user = current_user
      @note.save
      redirect_to note_path(@note)
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find_by(id: @note.user_id)
  end

  def edit
  end

  def update
    if current_user
      @note.update(note_params)
      redirect_to note_path(@note)
    else
      redirect_to root_path
    end
  end

  def destroy

  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
