# == Schema Information
#
# Table name: races
#
#  id           :integer          not null, primary key
#  race_id      :integer
#  monster_race :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Race < ActiveRecord::Base
  attr_accessible :monster_race, :race_id

  has_many :monsters,
  		:primary_key => :race_id

  def to_s
  	self.monster_race
  end

end
