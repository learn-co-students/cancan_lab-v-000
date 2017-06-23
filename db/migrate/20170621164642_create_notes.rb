class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
    end
  end
end
