class OneMoreTime < ActiveRecord::Migration
  def change
    remove_column :notes, :user_id
    add_column :notes, :user, :integer
  end
end
