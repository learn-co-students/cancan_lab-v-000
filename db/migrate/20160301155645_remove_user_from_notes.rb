class RemoveUserFromNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :user, :string
  end
end
