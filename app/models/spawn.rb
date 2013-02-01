# == Schema Information
#
# Table name: spawns
#
#  id         :integer          not null, primary key
#  map_name   :string(255)
#  x_cord     :integer
#  y_cord     :integer
#  x2_cord    :integer
#  y2_cord    :integer
#  monster    :string(255) ## It's "monster" for all entries!
#  name       :string(255)
#  mob_id     :integer
#  amount     :integer
#  delay      :integer
#  variance   :integer
#  event      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Spawn < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :monster, :map_name, :mob_id, :amount, :delay, :variance

  belongs_to :monster,
      :inverse_of => :spawns,
      :foreign_key => :mob_id,
      :primary_key => :mobid
      
  default_scope includes(:map)
  belongs_to :map,
      :counter_cache => :amount,
      :inverse_of => :spawns,
      :primary_key => :map_id,
      :foreign_key => :map_name

	before_save :update_map_id

	
  	private

	def update_map_id
	    #only rebuild if any rewards have been changed
	    return unless map_name_changed?
      self.map = Map.where(:map_id=>self.map_name).first_or_create
	end
  
end
