class NotesController < ApplicationController
  def index
  end

  def new
  end

  def create
    if session[:user_id]
      @note = Note.new(note_params)
      @note.user = current_user
      @note.readers << @note.user
      @note.save
    end
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    @note = Note.find(params[:id])
    if can? :update, @note
      @note.update(note_params)
    end
    redirect_to root_path
  end

  def destroy
  end

  private

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end
