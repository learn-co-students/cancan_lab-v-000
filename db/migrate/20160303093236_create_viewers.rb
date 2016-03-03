class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
    	t.string :user_id
    	t.string :note_id
      
      t.timestamps null: false
    end
  end
end
