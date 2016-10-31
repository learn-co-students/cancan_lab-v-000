class NotesController < ApplicationController

  def index
    @notes = Note.all
    render :index
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    if logged_in?
      @user = User.find(session[:user_id])
      @note = @user.notes.new(note_params)
      @note.readers << @user
      @note.save
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def edit
    @note = Note.find(params[:id])
    if @note.user == current_user
      render :edit
    else
      redirect_to '/'
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.user == current_user
      @note.update(note_params)
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
