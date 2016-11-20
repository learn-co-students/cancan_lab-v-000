require 'pry'
require 'pry-rails'

class NotesController < ApplicationController
  before_action :require_login

  def create
    @note = current_user.notes.create(note_params)
    @note.readers << current_user
    redirect_to root_path
  end

  def update
    @note.update(note_params)
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

  def require_login
    redirect_to root_path unless session.include? :user_id
  end
end
