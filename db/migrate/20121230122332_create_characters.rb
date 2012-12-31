class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|

    	t.integer :jobid
    	t.integer :weight
    	t.integer :hpfactor
    	t.integer :hpmultiplicator
    	t.integer :spfactor
    	t.integer :unarmed
    	t.integer :dagger
    	t.integer :oneh_sword
    	t.integer :twoh_sword
    	t.integer :oneh_spear
    	t.integer :twoh_spear
    	t.integer :oneh_axe
    	t.integer :twoh_axe
    	t.integer :oneh_mace
    	t.integer :twoh_mace_unused
    	t.integer :rod
    	t.integer :bow
    	t.integer :knuckle
    	t.integer :instrument
    	t.integer :whip
    	t.integer :book
    	t.integer :katar
    	t.integer :revolver
    	t.integer :rifle
    	t.integer :gatling_gun
    	t.integer :shotgun
    	t.integer :grenade_launcher
    	t.integer :fuuma_shuriken
    	t.integer :twoh_staff
    	t.integer :shield

      t.timestamps
    end
  end
end
