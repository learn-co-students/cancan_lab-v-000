require 'pry'
class NotesController < ApplicationController
    before_action :set_note, only: [:update]
    load_and_authorize_resource

    def create
      if logged_in? 
        @note = current_user.notes.create(note_params)
        @note.readers << current_user
      end 
      redirect_to '/'
    end

    def update 
      if logged_in?
        @note.update(note_params)
      end 
    
      redirect_to '/'
    end

    private 

    def note_params
        params.require(:note).permit(:content, :user_id, :visible_to)
    end

    def set_note 
      @note = Note.find_by(id: params[:id])
    end 
    
end