class NotesController < ApplicationController

  def index
  end

  def create
    #can't create a note if you're not logged in
    if !logged_in?
      redirect_to '/'
    else
      @note = Note.create(note_params)
      @note.user = current_user
      @note.visible_to = (params[:note][:visible_to])
      current_user.readable << @note
      redirect_to '/'
    end
  end
  
  def show
  end

  def edit
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    @note.visible_to = (params[:note][:visible_to])
    current_user.readable << @note

    redirect_to '/'
  end

  def destroy
  end

  private
  def logged_in?
    session[:user_id] != nil
  end

  def note_params
    params.require(:note).permit(:content)
  end

  def current_user
    User.find(session[:user_id])
  end

end

