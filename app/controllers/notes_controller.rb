class NotesController < ApplicationController
  # before_action :require_login, except: [:index, :show]
  load_and_authorize_resource
  skip_authorize_resource :only => :index

  def index
  end

  def new
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      @note.readers << @note.user
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @note.update(note_params)
    redirect_to root_path
  end

  def destroy
  end

  private

  # def require_login
  #   redirect_to '/' unless logged_in?
  # end

  def note_params
    params.require(:note).permit(:content, :visible_to, :user)
  end

end