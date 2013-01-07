class MvpItem < ActiveRecord::Base
	# attr_accessible :title, :body
  
  belongs_to :monster, :inverse_of => :mvp_items
  belongs_to :item, :inverse_of => :mvp_items
  attr_accessible :percent, :item

end
