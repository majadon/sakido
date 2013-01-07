class AddJobnameToCharacters < ActiveRecord::Migration
  def change
  	add_column :characters, :jobname, :string # fügt eine Spalte ein
  end
end
