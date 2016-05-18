class ChangeNameToContentInNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :name, :string
    add_column :notes, :content, :string
  end
end
