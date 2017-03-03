class NotesController < ApplicationController
    load_and_authorize_resource
    before_action :set_notes, only: [:show, :edit, :update]
    # before_action :require_login
    # skip_before_action :require_login, only: [:index]

    def index
        @notes = Note.all
    end

    def show

    end

    def new
        @note = Note.new
    end

    def edit

    end

    def create
        # binding.pry
      # @note = Note.find_or_create_by(notes_params(:content))
      @note = Note.create(note_params(:content, :user_id))
      redirect_to note_path(@note)
    end

    def update
     @note.update(note_params(:content, :user_id))
      redirect_to note_path(@note)
    end

    private

    def set_note
      @note = Note.find(params[:id])
    end

    def note_params(*args)
        # binding.pry
      params.require(:note).permit(*args)
    end

end