class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|

    	t.integer :mobid
    	t.string :sprite_name
    	t.string :kroname
    	t.string :ironame
    	t.integer :lv
    	t.integer :hp
    	t.integer :sp
    	t.integer :exp
    	t.integer :jexp
    	t.integer :range1
    	t.integer :atk1
    	t.integer :atk2
    	t.integer :def
    	t.integer :mdef
    	t.integer :str
    	t.integer :agi
    	t.integer :vit
    	t.integer :int
    	t.integer :dex
    	t.integer :luk
    	t.integer :range2
    	t.integer :range3
    	t.integer :scale
    	t.integer :race
    	t.integer :element
    	t.string :mode
    	t.integer :speed
    	t.integer :adelay
    	t.integer :amotion
    	t.integer :dmotion
    	t.integer :mexp
    	t.integer :mvp1id
    	t.integer :mvp1per
    	t.integer :mvp2id
    	t.integer :mvp2per
    	t.integer :mvp3id
    	t.integer :mvp3per
    	t.integer :drop1id
    	t.integer :drop1per
    	t.integer :drop2id
    	t.integer :drop2per
    	t.integer :drop3id
    	t.integer :drop3per
    	t.integer :drop4id
    	t.integer :drop4per
        t.integer :drop5id
        t.integer :drop5per
        t.integer :drop6id
        t.integer :drop6per
        t.integer :drop7id
        t.integer :drop7per
        t.integer :drop8id
        t.integer :drop8per
        t.integer :drop9id
        t.integer :drop9per
        t.integer :dropcardid
        t.integer :dropcardper 
        t.timestamps

    end
  end
end
