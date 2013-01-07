class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.integer :race_id
      t.string :monster_race

      t.timestamps
    end
  end
end
