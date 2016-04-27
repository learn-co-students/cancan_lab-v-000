class NotesController < ApplicationController
  #before_action :set_note, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource only: [:edit, :show, :update]
  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.none 
    if current_user
      @notes = current_user.readable
    end   
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    render partial: 'form', locals: {note: Note.new}
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    note = Note.new(note_params)
    note.user = current_user
    note.save!
    redirect_to '/'
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    note.update(note_params)
    redirect_to '/'
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:content, :visible_to)
    end
end
