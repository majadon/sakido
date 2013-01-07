class CreateScales < ActiveRecord::Migration
  def change
    create_table :scales do |t|
      t.integer :scale_id
      t.string :size

      t.timestamps
    end
  end
end
