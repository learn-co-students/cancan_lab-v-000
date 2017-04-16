class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.belongs_to :users
      t.belongs_to :notes
      t.timestamps null: false
    end
  end
end
