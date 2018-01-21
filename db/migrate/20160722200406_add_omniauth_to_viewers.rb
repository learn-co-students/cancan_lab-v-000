class AddOmniauthToViewers < ActiveRecord::Migration
  def change
    add_index :viewers, :note_id
    add_index :viewers, :user_id
  end
end
