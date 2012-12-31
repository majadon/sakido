class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|

      t.integer :itemid
      t.string :aegisname
      t.string :name
      t.integer :modeltype
      t.integer :buy
      t.integer :sell
      t.integer :weight
      t.integer :atk
      t.integer :def
      t.integer :range
      t.integer :slots
      t.string :job
      t.integer :upper
      t.integer :gender
      t.integer :loc
      t.integer :wlv
      t.integer :elv
      t.integer :refineable
      t.integer :view
      t.string :script
      t.string :onequip_script
      t.string :onunequip_script

      t.timestamps
    end
  end
end
