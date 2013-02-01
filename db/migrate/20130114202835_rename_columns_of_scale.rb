class RenameColumnsOfScale < ActiveRecord::Migration
  def up
  	rename_column :monsters, :scale, :scale_id
  end

  def down
  	rename_column :monsters, :scale_id, :scale
  end
end
