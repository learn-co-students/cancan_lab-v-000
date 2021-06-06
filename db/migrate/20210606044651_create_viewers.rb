class CreateViewers < ActiveRecord::Migration[5.0]
  def change
    create_table :viewers do |t|
      t.integer :note_id
      t.integer :user_id

      t.timestamps
    end
  end
end
