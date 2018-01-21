class CreateViwers < ActiveRecord::Migration
  def change
    create_table :viwers do |t|
      t.integer :user_id
      t.integer :note_id

      t.timestamps null: false
    end
  end
end
