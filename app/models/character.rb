class Character < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :jobid

  def to_s
  	self.jobid
  end

end
