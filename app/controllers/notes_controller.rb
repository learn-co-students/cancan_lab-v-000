require 'pry'
class NotesController < ApplicationController
  load_and_authorize_resource
  before_action :must_be_logged_in
  skip_before_action :index

  def index
    
  end

  def new
    
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      redirect_to '/'
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    if @note.save
      redirect_to '/'
    else
      render :edit
    end
    
  end

  private

  def must_be_logged_in
    if !logged_in? 
      redirect_to '/'
    end
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end