class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

 def index
 end

 def new
   @note = Note.new
 end

 def create
   note = Note.new(notes_params)
   note.user = current_user
   note.save!
   redirect_to root_path
 end

 def show
   @note = Note.find_by(id: params[:id])
 end

 def edit
   @note = Note.find(params[:id])
 end


 def update
   note = Note.find(params[:id])
   note.update(notes_params)
   redirect_to '/'
 end

 def destroy
 end

 private

 def notes_params
   params.require(:note).permit(:content, :visible_to)
 end


end
