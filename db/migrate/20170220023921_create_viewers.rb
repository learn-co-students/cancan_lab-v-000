class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.references :note
      t.references :user

      t.timestamps null: false
    end
  end
end
