class NotesController < ApplicationController
  before_action :get_note, only: [:edit, :show, :update, :destroy]
  before_action :get_note_user, only: [:new, :edit]
  
  load_and_authorize_resource only: [:edit, :show, :update, :destroy]

  def index
    @notes = current_user.readable
  end

  def create
    if current_user.nil?
      redirect_to root_path
    else      
      note = Note.create(note_params)
      note.readers << current_user
      redirect_to root_path
    end
  end

  def new
    @note = Note.new    
    redirect_to login_path if @user.nil?
  end

  def edit
  end

  def show
  end

  def update
    @note.update(note_params)
    redirect_to root_path
  end

  def destroy
    @note.delete
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(:content, :user_id, :visible_to)
  end

  def get_note
    @note = Note.find(params[:id])
  end

  def get_note_user
    @user = current_user
  end

end