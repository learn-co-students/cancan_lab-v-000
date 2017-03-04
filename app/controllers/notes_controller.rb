class NotesController < ApplicationController
    load_and_authorize_resource
    before_action :set_note, only: [:show, :edit, :update]

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
      @note = Note.create(note_params(:content))
      # binding.pry
      # @note.user_id = session[:user_id]
      @note.user = current_user
      @note.readers << @note.user
      @note.save
      redirect_to root_path(@note)
    end

    def update
     @note.update(note_params(:content))
     @note.readers.clear
     @note.visible_to = params[:note][:visible_to]
     @note.readers << @note.user
     @note.save
      redirect_to root_path(@note)
    end

    private

    def set_note
      @note = Note.find(params[:id])
    end

    def note_params(*args)
      params.require(:note).permit(*args)
    end

end