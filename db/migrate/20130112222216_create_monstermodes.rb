class CreateMonstermodes < ActiveRecord::Migration
  def change
    create_table :monstermodes do |t|
      t.string :mode_id

      t.timestamps
    end
  end
end
