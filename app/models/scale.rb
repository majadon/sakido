# == Schema Information
#
# Table name: scales
#
#  id         :integer          not null, primary key
#  scale_id   :integer
#  size       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Scale < ActiveRecord::Base
  attr_accessible :scale_id, :size

  has_many :monsters,
        :foreign_key => :scale_id,
        :primary_key => :scale_id

  def to_s
  	self.size
  end

end
