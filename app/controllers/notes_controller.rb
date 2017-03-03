class NotesController < ApplicationController

  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  skip_before_action :require_login, only: [:index]

  def new
    @note = Note.new
  end

  def show
  end

  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.'}
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content)
  end

  def require_login
    redirect_to '/' unless session.include? :user_id
  end

end
