class FixNote < ActiveRecord::Migration
  def change
    remove_column :notes, :user
    add_column :notes, :user_id, :integer
  end
end
