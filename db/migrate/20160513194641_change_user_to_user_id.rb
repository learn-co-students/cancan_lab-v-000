class ChangeUserToUserId < ActiveRecord::Migration
  def change
    change_table :notes do |t|
      t.remove  :user
      t.integer :user_id
    end
  end
end
