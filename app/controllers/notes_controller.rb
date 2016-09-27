class NotesController < ApplicationController
  # load_and_authorize_resource

  def index
    @notes = Note.all
  end

  def new
  end


  def create
    if session[:user_id]
      user = User.find_by(session[:user_id])
      note = Note.new(params)
      note.user = current_user
      user.notes.build(note_params)
      note.save
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

    def update
      if session[:user_id]
        user = User.find(session[:user_id])
        note = Note.find(params[:id])
        note.user = current_user
        note.update(note_params)
      end
        redirect_to '/'
    end

  def edit
  end


  def show
    # @notes = Note.all
  end

  def destroy
    note.delete
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
