class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
    	t.text :content
    	t.string :user
      	t.timestamps null: false
    end
  end
end
