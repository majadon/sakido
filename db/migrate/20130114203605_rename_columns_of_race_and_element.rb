class RenameColumnsOfRaceAndElement < ActiveRecord::Migration
  def up
  	rename_column :monsters, :race, :race_id
  	rename_column :monsters, :element, :element_id
  end

  def down
  	rename_column :monsters, :race_id, :race
  	rename_column :monsters, :element_id, :element
  end
end
