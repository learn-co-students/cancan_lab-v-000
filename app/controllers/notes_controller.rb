class NotesController < ApplicationController

  def index
    
  end

  def new
  end


  def create
    note = Note.new(params)
    note.save
  end

  def edit
  end

  def update
    note = Note.find_by(:id)
  end

  def show
    @notes = Note.all
  end

  def destroy
    note.delete
  end

  private

  # def
    # .required

end
