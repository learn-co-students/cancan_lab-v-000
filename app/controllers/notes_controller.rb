class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]
  def index
  end

  def new
    @note = Note.new
    # @note.viewers.build
  end

  def show
    @note = Note.find(params[:id])
  end

  def create
     note = Note.new(note_params)
     note.user = current_user
     note.save!
     redirect_to '/'
   end


  # def create
  #   user = User.find([:id])
  #   if session[:user_id] == user.id
  #     note = Note.new(note_params)
  #   end
  #   if !note.nil?
  #     note.save
  #     redirect_to '/'
  #   else
  #     redirect_to controller: 'notes', action: 'index'
  #   end
  # end


  def edit

  end

  def update

  end

  def destroy

  end
  private

  def note_params
    params.require(:note).permit(:content, visible_to:[:name])
  end

end
