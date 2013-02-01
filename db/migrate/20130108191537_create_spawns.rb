class CreateSpawns < ActiveRecord::Migration
  def change
    create_table :spawns do |t|

    	t.string :map_name
    	t.integer :x_cord
    	t.integer :y_cord
    	t.integer :x2_cord
    	t.integer :y2_cord
    	t.string :monster 
    	t.string :name 
    	t.integer :mob_id
    	t.integer :amount
    	t.integer :delay
    	t.integer :variance
    	t.integer :event

      t.timestamps
    end
  end
end