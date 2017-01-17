class FixViewersTable < ActiveRecord::Migration
  def change
    remove_column :viewers, :notes_id, :integer
    add_column :viewers, :note_id, :integer
  end
end
