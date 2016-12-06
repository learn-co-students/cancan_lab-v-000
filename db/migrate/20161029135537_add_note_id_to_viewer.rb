class AddNoteIdToViewer < ActiveRecord::Migration
  def change
    add_column :viewers, :note_id, :integer
  end
end
