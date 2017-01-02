class NotesController < ApplicationController
  load_and_authorize_resource except: :create

  def new

  end

  def create
    @note = Note.new(params_check)
    @note.user = current_user
    @note.save!
    redirect_to root_path
  end

  def update
    @notee = Note.find(params[:id])
  @notee.update(params_check)
  @notee.save
  redirect_to root_path
  end

  private

  def params_check
    params.require(:note).permit(:content, :visible_to)
  end
end
