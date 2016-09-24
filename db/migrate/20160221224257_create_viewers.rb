class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.integer :user_id
      t.integer :note_id
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
