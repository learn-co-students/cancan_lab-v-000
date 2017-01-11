require 'pry'

class NotesController < ApplicationController
  load_and_authorize_resource
  before_action :find_note, only: [:index, :show, :edit, :update, :destroy]
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.save
    redirect_to root_path
  end

  def show

  end

  def edit
  end

  def update
    @note.update(note_params)
    redirect_to root_path
  end

  def destroy

  end

  private

  def find_note
    @note = Note.find_by(id: params[:id])
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
