class NotesController < ApplicationController
    load_and_authorize_resource only: [:new, :edit, :show, :update]

    def index
        @notes = Note.all
    end

    def new
        @note = Note.new
        render partial: 'form', locals: {note: @note}
    end

    def create
        #raise note_params.inspect
        note = Note.new(note_params)
        note.user_id = session[:user_id]
        note.save
        redirect_to '/'

    end

    def show
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
