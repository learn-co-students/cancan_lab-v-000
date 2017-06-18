class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def show
    @note = Note.find_by(id: params[:id])
    authorize! :read, @note
    if !@note
      redirect_to root_path
    end
  end

  def edit
    @note = Note.find_by(id: params[:id])
    authorize! :edit, @note
  end

  def create
    @note = Note.new(content: post_params[:content], user: current_user)
    authorize! :create, @note
    @note.save
    @note.viewers.create(user: current_user)
    redirect_to root_url
  end

  def update
    @note = Note.find_by(id: params[:id])
    authorize! :edit, @note
    @note.update(post_params)
    redirect_to root_path
  end

  def destroy
    @note = note.find_by(id: params[:id])
    authorize! :destroy, @note
    @note.destroy
  end

  private
  def post_params
    params.require(:note).permit(:content, :visible_to)
  end
end
