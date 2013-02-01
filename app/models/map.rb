class Map < ActiveRecord::Base

	def to_s
		self.map_id
	end

	validates :map_id,
		:uniqueness => { :case_sensitive => false },
	  	:allow_blank => false

	has_many :spawns,
		:dependent => :destroy,
      	:primary_key => :map_id,
      	:foreign_key => :map_name
	has_many :monsters, :through => :spawns

	def to_param
    	"#{self.id}-#{self.to_s.parameterize}"
	end
end
