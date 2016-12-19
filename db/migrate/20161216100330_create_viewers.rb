class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.integer :note_id
      t.integer :user_id
      t.index :note_id
      t.index :user_id
      t.timestamps null: false
    end
  end
end
