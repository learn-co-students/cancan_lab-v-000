class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.integer :readable_id
      t.integer :reader_id

      t.timestamps null: false
    end
  end
end
