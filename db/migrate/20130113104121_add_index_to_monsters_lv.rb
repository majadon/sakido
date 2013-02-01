class AddIndexToMonstersLv < ActiveRecord::Migration
  def change
  	add_index :monsters, :lv
  end
end
