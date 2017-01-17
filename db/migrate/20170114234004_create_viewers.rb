class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.integer :notes_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
