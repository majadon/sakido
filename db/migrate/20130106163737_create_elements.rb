class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.integer :element_id
      t.string :monster_element

      t.timestamps
    end
  end
end
