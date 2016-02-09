class NotesController < ApplicationController
  load_and_authorize_resource

  def create
    if current_user
      @note = Note.new(note_params)
      @note.user = current_user
      @note.save
    end
    redirect_to '/'
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to '/'
  end

  private

  def note_params
    params.require('note').permit(:content, :visible_to)
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end
  end

end
