class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :viewers, :viewer_id, :note_id
  end
end


