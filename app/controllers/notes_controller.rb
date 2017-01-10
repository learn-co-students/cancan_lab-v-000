class NotesController < ApplicationController
  
  before_action :require_login
  load_and_authorize_resource

  def new
  end

  def create
	@note= Note.new(note_params)
	@user= User.find_by(id: session[:user_id])
	# add the current user as a user and reader of the note initiated
	@note.user = @user
	@note.readers << @user
	@note.save
	redirect_to '/'
  end

  def update
  	@note = Note.find_by(id: params[:id])
    @user = User.find_by(id: session[:user_id])
    return '/' if @note.nil? || @user.nil? ||@note.user != @user
    @note.attributes = note_params
    binding.pry
    @note.readers << @user if !@note.readers.include?(@user)
    @note.save
    redirect_to '/'
  end




  private
  def require_login 
  	redirect_to root_path if !session.include? :user_id
  end

  def note_params
  	params.require(:note).permit(:content, :visible_to)
  end

end
