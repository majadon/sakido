class RenameColumnOfSpawnMonster < ActiveRecord::Migration
  
  def up
  	rename_column :spawns, :monster, :monster_type
  end

  def down
  	rename_column :spawns, :monster_type, :monster
  end
end
