class NotesController < ApplicationController
  def new
    @note = Note.new
    @note.readers.build
  end

  def create
    if session[:user_id]
      @user = User.find(session[:user_id])
      note = Note.create(notes_params)
      note.readers << @user 
      note.visible_to=(params[:note][:visible_to])
      redirect_to root_path
    else
      redirect_to root_path
    end 
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @user = User.find(session[:user_id])
    if @note.readers.include?(@user)
      @note.update(notes_params)
      @note.visible_to=(params[:note][:visible_to])
      redirect_to root_path
    else
      redirect_to root_path
    end     
  end


  def show
  end

  def index
    @user = User.find(session[:user_id])
  end

  def destroy
  end


  def notes_params
    params.require(:note).permit(:content)
  end
end
