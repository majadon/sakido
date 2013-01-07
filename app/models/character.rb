class Character < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :jobid

  def to_s
  	"#{self.jobname}"
  end

  def to_param
    "#{self.id}-#{self.to_s.parameterize}"
  end

end
