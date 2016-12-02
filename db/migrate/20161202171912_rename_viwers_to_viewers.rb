class RenameViwersToViewers < ActiveRecord::Migration
  def change
    rename_table :viwers, :viewers 
  end
end
