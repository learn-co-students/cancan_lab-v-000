class NotesController < ApplicationController
  
  before_action :require_login
  load_and_authorize_resource
  #skip_authorize_resource only: [:new, :create]

  def index
    @notes = Note.all

  end

  def new
    @note = Note.new

  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      flash[:success] = "Note was saved!"
      redirect_to root_path
    else
      render 'new'
    end

  end



  def update

    if @note.update_attributes(note_params)
      flash[:success] = 'Note was updated!'
      redirect_to root_path
    else
      render 'edit'
    end

  end

  def destroy

    if @note.destroy
      flash[:success] = 'Note was destroyed!'
      redirect_to root_path
    else
      flash[:warning] = 'Cannot destroy this note...'
    end
    redirect_to root_path

  end

  private

  def note_params

    params.require(:note).permit(:content, :visible_to)
  end

  def require_login
    redirect_to root_path unless session.include? :user_id
  end


end
