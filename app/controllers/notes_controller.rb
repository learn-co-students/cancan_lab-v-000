class NotesController < ApplicationController
    load_and_authorize_resource :only => [:edit, :delete, :update]
    #full CRUD

    def index
        @notes = Note.all
    end

    def new
        @note = Note.new
    end

    def create
        @note = Note.new(note_params)
        @note.user = current_user
        if @note.save
            redirect_to '/'
        else
            redirect_to 'new_note_path'
        end
    end

    def show
        @note = Note.find_by(id: params[:id])
    end

    def edit
        @note = Note.find_by(id: params[:id])
    end

    def update
        @note.update(note_params)
        redirect_to '/'
    end

    def delete
        @note = Note.find_by(id: params[:id])
        @note.delete
        redirect_to '/'
    end

    private
    def note_params
        params.require(:note).permit(:content, :visible_to)
    end

end
