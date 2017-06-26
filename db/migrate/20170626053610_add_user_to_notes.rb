class AddUserToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :user, :integer
  end
end
