require 'pry'

class NotesController < ApplicationController

  def new

  end

  def create
    if session[:user_id] == nil || session[:user_id] == ""
      redirect_to root_path
    else
      @note = Note.create(content: params[:note][:content])
      @user = User.find(session[:user_id])
      @note.user_id = @user.id
      @note.readers << @user
      @note.save
      redirect_to root_path
    end
  end

  def update
    @note = Note.find_by(id: params[:id])

    if @note.user_id == session[:user_id]
      @note.update(content: params[:note][:content])
      @note.visible_to = params[:note][:visible_to]
      @note.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
