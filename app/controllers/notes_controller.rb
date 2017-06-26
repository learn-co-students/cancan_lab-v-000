class NotesController < ApplicationController

  def new
    if !session[:user_id]
      redirect_to root_path
    end
    @note = Note.new
    @note.user_id = session[:user_id]
  end

  def index
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to root_path
    end
  end

  def create
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
      @note = Note.new(content: params[:note][:content])
      @note.user_id = @user.id
      @note.readers << @user
      @note.save

      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @note = Note.find_by(id: params[:id])
  end

  def update
    @note = Note.find_by(id: params[:id])

    if @note.user_id == session[:user_id]
      @note.update(content: params[:note][:content])
      @note.visible_to = params[:note][:visible_to]
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
