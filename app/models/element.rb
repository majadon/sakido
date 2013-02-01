# == Schema Information
#
# Table name: elements
#
#  id              :integer          not null, primary key
#  element_id      :integer
#  monster_element :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Element < ActiveRecord::Base
  attr_accessible :element_id, :monster_element

  has_many :monsters,
  		:primary_key => :element_id

  def to_s
  	self.monster_element
  end

end
