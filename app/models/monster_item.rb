class MonsterItem < ActiveRecord::Base
	# attr_accessible :title, :body

  belongs_to :monster, :inverse_of => :monster_items
  belongs_to :item, :inverse_of => :monster_items
  attr_accessible :percent, :item

end
