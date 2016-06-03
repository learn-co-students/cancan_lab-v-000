class UpdateViewers < ActiveRecord::Migration
  def change
    remove_column :viewers, :note
    add_column :viewers, :note_id, :integer
  end
end
