class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def index
    @notes = Note.all 
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note
      #@note.user_id = current_user.id
      @note.readers << current_user
      @note.visible_to=(note_params[:visible_to])
      @note.save
      redirect_to '/', notice: "Note was successfully created."
      # or flash[:notice] = msg in quotes - must be done with :success and :danger
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @note.readers.clear
    if @note.update(note_params)
      @note.readers << current_user
      @note.visible_to=(note_params[:visible_to])
      redirect_to '/', notice: 'Note was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to '/', notice: "Note was successfully destroyed."
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content, :user_id, :visible_to)
  end

  def require_login
    redirect_to '/' unless session.include? :user_id
  end
end
