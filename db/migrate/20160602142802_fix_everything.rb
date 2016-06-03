class FixEverything < ActiveRecord::Migration
  def change
    remove_column :viewers, :user
    add_column :viewers, :user_id, :integer

    remove_column :notes, :user
    add_column :notes, :user_id, :integer


  end
end
