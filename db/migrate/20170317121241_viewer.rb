class Viewer < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.belongs_to :user
      t.belongs_to :note
    end
  end
end
