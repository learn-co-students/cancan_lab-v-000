class AddUserIdToNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :user, :integer
    add_column :notes, :user_id, :integer
  end
end
