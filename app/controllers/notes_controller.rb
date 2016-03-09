class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def new
    @note = Note.new
  end
  
  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @notes = Note.none
    if current_user
      @notes = current_user.readable
    end
  end

  def show
  end

  def edit
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    if @note.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end