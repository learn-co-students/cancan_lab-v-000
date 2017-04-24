class DropNotesUsers < ActiveRecord::Migration
  def change
    drop_table :notes_users
  end
end
