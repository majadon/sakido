class CreateMonsterItems < ActiveRecord::Migration
  def change
    create_table :monster_items do |t|
      t.references :monster
      t.references :item
      t.integer :percent

      t.timestamps
    end
    add_index :monster_items, :monster_id
    add_index :monster_items, :item_id
  end
end
