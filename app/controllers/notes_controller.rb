class NotesController < ApplicationController

  def create
    if logged_in?
      current_user
      @user.notes.create(note_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
  end

  def update
    if logged_in?
      current_user
      Note.find(params[:id]).update(note_params)
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
