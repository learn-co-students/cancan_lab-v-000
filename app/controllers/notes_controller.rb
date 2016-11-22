class NotesController < ApplicationController
  load_and_authorize_resource except: [:create, :update]

  def index
  end

  def show
  end

  def new
  end

  def create
    if !!current_user
      @note = Note.new(note_params)
      @note.user_id = current_user
      @note.readers << @note.user
      @note.save
      authorize! :create, @note
    else
      redirect_to root_path
    end
  end

  def update
    @note = Note.find(params[:id])
    @note.update_attributes(note_params)
    redirect_to root_path
  end

  def destroy
  end

private
  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
