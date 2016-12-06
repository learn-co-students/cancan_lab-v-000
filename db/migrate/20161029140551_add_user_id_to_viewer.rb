class AddUserIdToViewer < ActiveRecord::Migration
  def change
    add_column :viewers, :user_id, :integer
  end
end
