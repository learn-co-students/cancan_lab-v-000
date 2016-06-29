class ChangeUserFromNotes < ActiveRecord::Migration
  def change
    change_table :notes do |t|
      t.rename :user, :user_id
    end
  end
end
