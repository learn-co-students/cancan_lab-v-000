class NotesController < ApplicationController

    def create
        if current_user
            note = current_user.notes.build(note_params)
            note.readers << current_user
            note.save
        end
        redirect_to "/"
    end

    def update
        @note = Note.find_by(id: params[:id])
        authorize! :update, @note
        @note.update(note_params)
        @note.readers << current_user
        @note.save

        redirect_to "/"
    end

    private
    def note_params
        params.require(:note).permit(:content, :visible_to)
    end

end
