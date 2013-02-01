class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :map_id, :null=>false
      t.timestamps
    end
    add_index :maps, :map_id, :unique => true
  end
end
