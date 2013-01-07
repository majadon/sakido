class Scale < ActiveRecord::Base
  attr_accessible :scale_id, :size

  def to_s
  	self.size
  end

end