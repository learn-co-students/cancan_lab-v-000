class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
    	t.belongs_to :note, index: true
    	t.belongs_to :user, index:true

      t.timestamps null: false
    end
  end
end
