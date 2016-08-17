class NotesController < ApplicationController
  load_and_authorize_resource
   skip_authorize_resource :only => :home

  def home

  end

  def new
    if current_user
      current_user.note.build
    else
      redirect_to root_path

    end
  end

  def create
    note = Note.new(note_params)
    note.user = current_user
    note.save
    # binding.pry
    redirect_to root_path
  end

  def show

  end

  def index

  end

  def edit
    @note = Note.find(id: params[:id])
    binding.pry
  end

  def update
    note = Note.last
    note.update(note_params)
    note.save
    redirect_to root_path
    # binding.pry
  end

  def destroy

  end

  def note_params
    params.require(:note).permit(:name, :content, :visible_to)
  end
end
