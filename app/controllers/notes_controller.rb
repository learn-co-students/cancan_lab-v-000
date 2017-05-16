class NotesController < ApplicationController
  def create
    @note = Note.new(params.require(:note).permit(:content, :visible_to))
    @note.user = User.find_by_id(session[:user_id])
    @note.save
    redirect_to '/'
  end

  def update

    @note.update(params.require(:note).permit(:content, :visible_to))
    binding.pry
    redirect_to '/'
  end

  def index

  end
end
