class Monster < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :mobid

	  def to_s
      self.ironame
    end

    def atkrange
      "#{self.atk1} ~ #{self.atk2}"
    end

    def drops
      Item.where(:itemid => [drop1id, drop2id, drop3id, drop4id, drop5id, drop6id, drop7id, drop8id, drop9id, dropcardid])
    end

    def mvpdrops
      Item.where(:itemid => [mvp1id, mvp2id, mvp3id])
    end

    def to_param
      "#{self.id}-#{self.to_s.parameterize}"
    end

end
