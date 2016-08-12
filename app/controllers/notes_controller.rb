require 'pry'

class NotesController < ApplicationController
  load_and_authorize_resource

  def index
    @notes = Note.all
  end

  def root_url
    self.new
  end

  def new
    current_user.notes.build(Note.new)
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    @note.save!
    redirect_to root_path
  end

  def edit

  end

  def update
    if @note.update_attributes(note_params)
      @note.save
      redirect_to root_path
    else
      render :action => :edit
    end
  end

  def destroy
    @note = Note.find_by(note_params[:id])
    @note.destroy
    redirect_to notes_path
  end

  def show

    @note = Note.find(params[:id])
  end

  private

  def note_params
    params.require(:note).permit(:id, :note_id, :content, :visible_to)
  end
end