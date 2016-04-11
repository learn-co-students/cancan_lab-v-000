class NotesController < ApplicationController
  # load_and_authorize_resource

  def new
    if logged_in?
      current_user
      @note=Note.new
    else
      redirect_to login_path
    end
  end

  def create
    if logged_in?
      @user=current_user
      @note=Note.create(note_params)
      @note.user=@user
      @note.readers << @user
      redirect_to root_path
    else
      redirect_to root_path
    end

  end

  def show
    @note=Note.find(params[:id])
    authorize! :read, @note
# byebug
  end

  def edit
    if logged_in?
      current_user
      @note=Note.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
# byebug
    @note=Note.find(params[:id])
    @note.update(note_params)
# byebug
    authorize! :edit, @note
    redirect_to root_path
  end

  def destroy
  end

  private
    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end
