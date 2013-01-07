class Race < ActiveRecord::Base
  attr_accessible :monster_race, :race_id

  def to_s
  	self.monster_race
  end

end
