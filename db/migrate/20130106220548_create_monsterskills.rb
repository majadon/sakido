class CreateMonsterskills < ActiveRecord::Migration
  def change
    create_table :monsterskills do |t|

    	t.integer :mobid
    	t.string :dummy_value
    	t.string :state
    	t.integer :skill_id
    	t.integer :skill_lv
    	t.integer :rate
    	t.integer :casttime
    	t.integer :delay
    	t.string :cancelable
    	t.string :target
    	t.string :condition_type
    	t.string :condition_value
    	t.integer :val1
    	t.integer :val2
    	t.integer :val3
    	t.integer :val4
    	t.integer :val5
    	t.string :emotion
    	t.string :chat

      t.timestamps
    end
  end
end
