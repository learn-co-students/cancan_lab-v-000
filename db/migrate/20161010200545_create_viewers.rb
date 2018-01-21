class CreateViewers < ActiveRecord::Migration
  def change
    create_table :viewers do |t|
      t.references :user, index: true, foriegn_key: true
      t.references :note, index: true, foriegn_key: true

      t.timestamps null: false
    end
  end
end
