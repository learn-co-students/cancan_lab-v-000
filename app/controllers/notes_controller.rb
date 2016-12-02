class NotesController < ApplicationController
  # load_and_authorize_resource only: [:edit, :show, :update]
   before_action :set_note, only: [:edit, :show, :destroy, :update]


    def index
      @notes = Note.all

    end

    def show

    end

    def new
      if logged_in?
        @note = Note.new
      else
        redirect_to login_path
      end
    end

    def create
      note = Note.new(note_params)
      note.user = current_user
      note.save!
      redirect_to root_path
    end

    def edit
    end

    def update
      @note.update(note_params)
      redirect_to root_path
    end

    def destroy
    end

    private

    def set_note
      @note = Note.find_by(id: params[:id])
    end

    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end
