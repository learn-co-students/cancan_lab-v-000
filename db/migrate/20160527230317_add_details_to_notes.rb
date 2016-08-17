class AddDetailsToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :content, :text
    add_column :notes, :user_id, :integer
  end
end
