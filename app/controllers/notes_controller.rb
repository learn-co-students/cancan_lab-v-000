class NotesController < ApplicationController
  def new
    authorize! :create, :note
    @note = Note.new()
  end

  def create
    authorize! :create, :note

    #look at this garbage to pass the test
    arg_params = {:user_id => current_user.id}
    note_params.each do |key,val|
      arg_params[key] = val
    end

    @note = Note.create(arg_params)
    redirect_to root_path
  end

  def show
    @note = Note.find(params[:id])
    authorize! :read, @note
  end

  def index
    if logged_in?
      @notes = current_user.readable.uniq
    else
      redirect_to root_path
    end
  end

  def edit
    @note = Note.find(params[:id])
    authorize! :update, @note
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:content,
      :visible_to
    )
  end
end
