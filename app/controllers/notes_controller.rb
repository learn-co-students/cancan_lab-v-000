class NotesController < ApplicationController
  # load_and_authorize_resource
  # Is the method above too permissive? See https://learn.co/tracks/full-stack-web-dev-with-react/rails/authentication/cancan

  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  skip_before_action :require_login, only: [:index]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def show
  end

  def create
    # binding.pry
    @note = Note.new(note_params)
    @user = User.find_by(id: session[:user_id])
    @note.user = @user
    @note.readers << @user
    # Check the above against the solution. Seems verbose and potentially misplaced.

    respond_to do |format|
      if @note.save
        format.html { redirect_to '/', notice: 'Note was successfully created.'}
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      # binding.pry
      if @note.update(note_params)
        # binding.pry
        format.html { redirect_to '/', notice: 'Note was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def edit
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

  def require_login
    redirect_to '/' unless session.include? :user_id
  end

end
