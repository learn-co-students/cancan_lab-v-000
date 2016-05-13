class NotesController < ApplicationController
  load_and_authorize_resource param_method: :notes_params


    def create
      if !current_user.nil?
        note = Note.new(notes_params)
        note.user_id = current_user.id
        note.save
        note.add_user_to_reader
      end
      redirect_to '/'
    end

    def edit
      @note = Note.find(params[:id])
    end

    def update
      @note = Note.find(params[:id])
      @note.readers.delete_all
      @note.update(notes_params)
      @note.add_user_to_reader
      redirect_to '/'
    end

    def show
      @note = Note.find(params[:id])
      redirect_to '/'
    end

  private
    def notes_params
      params.require(:note).permit(:content, :visible_to)
    end

end
