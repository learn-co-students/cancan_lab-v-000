class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    user = User.find_by(id: session[:user_id])
    unless user.nil?
      @note = Note.new(note_params)
      @note.user = user
      @note.save
    end
    redirect_to root_path
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to '/'
  end

  def edit
  end

  def show
  end

  private

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end
