class Element < ActiveRecord::Base
  attr_accessible :element_id, :monster_element

  def to_s
  	self.monster_element
  end

end
