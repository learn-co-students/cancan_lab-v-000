class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.integer :user
      t.integer :note

      t.timestamps null: false
    end
  end
end
