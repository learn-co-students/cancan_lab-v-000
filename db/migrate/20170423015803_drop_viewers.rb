class DropViewers < ActiveRecord::Migration
  def change
    drop_table :viewers
  end
end
