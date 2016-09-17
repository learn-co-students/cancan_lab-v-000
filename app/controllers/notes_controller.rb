class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end


  def show
  end

  def new
    @note = Note.new
  end


  def edit
  end

  def create
    if session.include? :user_id
      @note = Note.new(note_params)
      @note.user = current_user
      @note.readers << current_user
      @note.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  def update
    if session.include? :user_id
      @note.update(note_params)
      binding.pry
      redirect_to root_path
    else
      redirect_to root_path
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end
