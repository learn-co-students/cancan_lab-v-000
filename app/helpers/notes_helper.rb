module NotesHelper
  def title(note)
    if current_page?(action: 'index')
      link_to note.content, note_path(note)
    else 
      note.content
    end
  end
end
