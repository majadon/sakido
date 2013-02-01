# == Schema Information
#
# Table name: monstermodes
#
#  id         :integer          not null, primary key
#  mode_id    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Monstermode < ActiveRecord::Base
  attr_accessible :mob_mode

  def to_s
  	self.mode_id
  end

end
