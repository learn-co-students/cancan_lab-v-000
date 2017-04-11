class NotesController < ApplicationController
    before_action :require_login
    load_and_authorize_resource
    skip_load_and_authorize_resource :only => :new

    def index
        @notes = Note.all
    end
    def new
        @note = Note.new
    end
    def create
        binding.pry
        @note = current_user.notes.build(note_params)
        if @note.save
            redirect_to note_path(@note) 
        else
            render new_note_path
        end
    end

    def edit
        @note = Note.find(params[:id])
    end
    def show
        @note = Note.find(params[:id])
    end
    def update
        @note = Note.find(params[:id])
        if @note.update(note_params)
            redirect_to note_path(@note)
        else
            render edit_note_path
        end
    end
    def destroy
        @note = Note.find(params[:id])
        @note.destroy
        redirect_to notes_path
    end

    private 
    def note_params
        
        params.require(:note).permit(:content, :user_id, :visible_to, :readers)
    end
    
    def require_login
        if !user_signed_in? 
          redirect_to root_path
        end
    end
end