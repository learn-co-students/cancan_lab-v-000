class NotesController < ApplicationController
  load_and_authorize_resource except: :create

  def create
    @note = Note.new(params_check)
    @note.user = current_user
    @note.save
    redirect_to root_path
    #raise @note.inspect
  end

  private

  def params_check
    params.require(:note).permit(:content, :visible_to)
  end
end
