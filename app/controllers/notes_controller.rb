class NotesController < ApplicationController
  def new
  end

  def create
    # binding.pry
    # authorize! :show, @project
    # authorize! :update, @note
    if current_user
      @note = Note.new(note_params)
      @note.readers << current_user
      @note.user = current_user
      @note.save
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def show
  end

  def index
  end

  def update
    # binding.pry
    note = Note.find(params[:id])
    if authorize! :update, note
      note.update(note_params)
      redirect_to '/'
    end
  end

  def destroy
  end

    private

      def note_params
        params.require(:note).permit(:content, :visible_to)
      end
end