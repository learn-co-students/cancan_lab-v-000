class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def show
    @note = Note.find_by(id: params[:id])
    raise params.inspect
  end

  def edit
    @note = Note.find_by(id: params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end

end
