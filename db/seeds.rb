# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['registered', 'banned', 'moderator', 'admin'].each do |role|
	Role.find_or_create_by_name role
end

['Novice', 'Swordman', 'Magician', 'Archer', 'Acolyte', 'Merchant', 'Thief', 'Knight', 'Priest', 'Wizard', 'Blacksmith', 'Hunter', 'Assassin', 'Knight (Peco)', 'Crusader', 'Monk', 'Sage', 'Rogue', 
	'Alchemist', 'Bard', 'Dancer', 'Crusader (Peco)', 'Wedding', 'Super Novice', 'Gunslinger', 'Ninja', 'Novice High', 'Swordman High', 'Magician High', 'Archer High', 'Acolyte High', 'Merchant High', 
	'Thief High', 'Lord Knight', 'High Priest', 'High Wizard', 'Whitesmith', 'Sniper', 'Assassin Cross', 'Lord Knight (Peco)', 'Paladin', 'Champion', 'Professor', 'Stalker', 'Creator', 'Clown', 'Gypsy', 
	'Paladin (Peco)', 'Baby Novice', 'Baby Swordman', 'Baby Magician', 'Baby Archer', 'Baby Acolyte', 'Baby Merchant', 'Baby Thief', 'Baby Knight', 'Baby Priest', 'Baby Wizard', 'Baby Blacksmith', 
	'Baby Hunter', 'Baby Assassin', 'Baby Knight (Peco)', 'Baby Crusader', 'Baby Monk', 'Baby Sage', 'Baby Rogue', 'Baby Alchemist', 'Baby Bard', 'Baby Dancer', 'Baby Crusader (Peco)', 'Baby Super Novice',
	'Taekwon', 'Star Knight', 'Star Knight (flying)', 'Soul Linker', 'Gangsi (Bongun/Munak)', 'Death Knight', 'Dark Collector', 'Rune Knight (Regular)', 'Warlock (Regular)', 'Ranger (Regular)', 
	'Arch Bishop (Regular)', 'Mechanic (Regular)', 'Guillotine Cross (Regular)', 'Rune Knight (Trans)', 'Warlock (Trans)', 'Ranger (Trans)', 'Arch Bishop (Trans)', 'Mechanic (Trans)', 
	'Guillotine Cross (Trans)', 'Royal Guard (Regular)', 'Sorcerer (Regular)', 'Minstrel (Regular)', 'Wanderer (Regular)', 'Sura (Regular)', 'Genetic (Regular)', 'Shadow Chaser (Regular)', 
	'Royal Guard (Trans)', 'Sorcerer (Trans)', 'Minstrel (Trans)', 'Wanderer (Trans)', 'Sura (Trans)', 'Genetic (Trans)', 'Shadow Chaser (Trans)', 'Rune Knight (Dragon) (Regular)', 'Rune Knight (Dragon) (Trans)',
	'Royal Guard (Gryphon) (Regular)', 'Royal Guard (Gryphon) (Trans)', 'Ranger (Waug) (Regular)', 'Ranger (Waug) (Trans)', 'Mechanic (Mado) (Regular)', 'Mechanic (Mado) (Trans)', 'Baby Rune Knight', 
	'Baby Warlock', 'Baby Ranger', 'Baby Arch Bishop', 'Baby Mechanic', 'Baby Guillotine Cross', 'Baby Royal Guard', 'Baby Sorcerer', 'Baby Minstrel', 'Baby Wanderer', 'Baby Sura', 'Baby Genetic',
	'Baby Shadow Chaser', 'Baby Rune Knight (Dragon)', 'Baby Royal Guard (Gryphon)', 'Baby Ranger (Waug)', 'Baby Mechanic (Mado)', 'Super Novice (Expanded)', 'Super Baby (Expanded)', 'Kagerou', 'Oboro' ].each do |job|
	Character.find_or_create_by_jobname job 
end

[['0', 'Small'], ['1', 'Medium'], ['2','Large']].each do |id, scale|
	Scale.create(:scale_id => id, :size => scale)
end

[['0', 'Formless'], ['1', 'Undead'], ['2', 'Animal'], ['3', 'Plant'], ['4', 'Insect'],
 ['5', 'Fish'], ['6', 'Demon'], ['7', 'Demihuman'], ['8', 'Angel'], ['9', 'Dragon']].each do |id, mob_race|
	Race.create(:race_id => id, :monster_race => mob_race)
end

[['20', 'Neutral 1'], ['40', 'Neutral 2'], ['60', 'Neutral 3'], ['80', 'Neutral 4'],
 ['21', 'Water 1'], ['41', 'Water 2'], ['61', 'Water 3'], ['81', 'Water 4'],
 ['22', 'Earth 1'], ['42', 'Earth 2'], ['62', 'Earth 3'], ['82', 'Earth 4'],
 ['23', 'Fire 1'], ['43', 'Fire 2'], ['63', 'Fire 3'], ['83', 'Fire 4'],
 ['24', 'Wind 1'], ['44', 'Wind 2'], ['64', 'Wind 3'], ['84', 'Wind 4'],
 ['25', 'Poison 1'], ['45', 'Poison 2'], ['65', 'Poison 3'], ['85', 'Poison 4'],
 ['26', 'Holy 1'], ['46', 'Holy 2'], ['66', 'Holy 3'], ['86', 'Holy 4'],
 ['27', 'Shadow 1'], ['47', 'Shadow 2'], ['67', 'Shadow 3'], ['87', 'Shadow 4'],
 ['28', 'Ghost 1'], ['48', 'Ghost 2'], ['68', 'Ghost 3'], ['88', 'Ghost 4'],
 ['29', 'Undead 1'], ['49', 'Undead 2'], ['69', 'Undead 3'], ['89', 'Undead 4']].each do |id, mob_element|
	Element.create(:element_id => id, :monster_element => mob_element)
end

['MD_CANMOVE', 'MD_LOOTER', 'MD_AGGRESSIVE', 'MD_ASSIST', 'MD_CASTSENSOR_IDLE', 'MD_BOSS', 'MD_PLANT', 'MD_CANATTACK', 'MD_DETECTOR',
 'MD_CASTSENSOR_CHASE', 'MD_CHANGECHASE', 'MD_ANGRY', 'MD_CHANGETARGET_MELEE', 'MD_CHANGETARGET_CHASE', 'MD_TARGETWEAK', 'MD_RANDOMTARGET'].each do |mode|
	Monstermode.find_or_create_by_mode_id mode
end