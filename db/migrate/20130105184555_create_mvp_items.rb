class CreateMvpItems < ActiveRecord::Migration
  def change
    create_table :mvp_items do |t|
      t.references :monster
      t.references :item
      t.integer :percent

      t.timestamps
    end
    add_index :mvp_items, :monster_id
    add_index :mvp_items, :item_id
  end
end
