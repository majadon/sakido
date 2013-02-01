# == Schema Information
#
# Table name: mvp_items
#
#  id         :integer          not null, primary key
#  monster_id :integer
#  item_id    :integer
#  percent    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MvpItem < ActiveRecord::Base
	# attr_accessible :title, :body
  
  belongs_to :monster, :inverse_of => :mvp_items
  belongs_to :item, :inverse_of => :mvp_items
  attr_accessible :percent, :item

end
