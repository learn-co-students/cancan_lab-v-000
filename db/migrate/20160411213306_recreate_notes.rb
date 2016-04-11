class RecreateNotes < ActiveRecord::Migration
  def change
    drop_table :notes

    create_table :notes do |t|
      t.text :content
      t.string :user
      t.index :user

    end
  end
end
