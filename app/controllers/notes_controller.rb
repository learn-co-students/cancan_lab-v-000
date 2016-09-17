class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def new
    @note = Note.new
    render :new
  end

  def create
    @note = Note.create(note_params)
    @note.user = current_user
    @note.save
    redirect_to root_path
  end

  def edit
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to root_path
  end

  def show
    @note = Note.find(params[:id])
  end

  def index
    @notes = Note.all
  end

  def destroy
    self.destroy
  end

  private
    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end
