class Item < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :itemid

  has_many :monster_items, :dependent => :destroy
  has_many :monsters, :through => :monster_items

  has_many :mvp_items, :dependent => :destroy
  has_many :monsters, :through => :mvp_items

    def to_s
      self.name
    end

    def to_param
      "#{self.id}-#{self.to_s.parameterize}"
    end

end
