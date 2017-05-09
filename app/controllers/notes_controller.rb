class NotesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    @note = Note.new(note_params(:content, :visible_to))
    @note.readers << current_user
    @note.user = current_user
    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params(:content, :visible_to))
    @note.readers << current_user
    if @note.valid?
      redirect_to root_path
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
  end

  private

  def note_params(*args)
    params.require(:note).permit(*args)
  end
end
