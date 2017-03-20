class NotesController < ApplicationController
    load_and_authorize_resource only: [:edit, :update, :show]
   
    def create
        if current_user
            @note = Note.new(note_params)
            @note.user_id = current_user.id
            @note.save
            redirect_to '/'
        else 
            redirect_to '/'
        end
    end

    def update 
        @note.update(note_params)
        redirect_to '/'    
    end

    private

    def note_params
        params.require(:note).permit(:content, :visible_to)
    end

end
