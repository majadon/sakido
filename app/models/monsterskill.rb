class Monsterskill < ActiveRecord::Base
  # attr_accessible :title, :body

  def to_s
  	self.dummy_value
  end
  
end
