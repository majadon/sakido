class Monster < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :mobid

  @@drop_columns = [
    [:drop1id, :drop1per],
    [:drop2id, :drop2per],
    [:drop3id, :drop3per],
    [:drop4id, :drop4per],
    [:drop5id, :drop5per],
    [:drop6id, :drop6per],
    [:drop7id, :drop7per],
    [:drop8id, :drop8per],
    [:drop9id, :drop9per],
    [:dropcardid, :dropcardper] 
  ]

  @@mvp_drop_columns = [    
    [:mvp1id, :mvp1per],
    [:mvp2id, :mvp2per],
    [:mvp3id, :mvp3per]
  ]

  after_save :update_mobdrops, :update_mvp_mobdrops

  has_many :monster_items, :dependent => :destroy
  has_many :items, :through => :monster_items

  has_many :mvp_items, :dependent => :destroy
  has_many :items, :through => :mvp_items

	def to_s
    self.ironame
  end

  def to_param
    "#{self.id}-#{self.to_s.parameterize}"
  end

  def mob_scale
    Scale.where(:scale_id => scale).first
  end

  def mob_race
    Race.where(:race_id => race).first
  end

  def mob_element
    Element.where(:element_id => element).first
  end

  def mobskills
    Monsterskill.where(:mobid => mobid)
  end

  def atkrange
    "#{self.atk1} ~ #{self.atk2}"
  end
  

  private

  def update_mobdrops
    #only rebuild if any rewards have been changed
    return unless columns_changed?(@@drop_columns)
    self.monster_items.destroy_all
    @@drop_columns.each do |column_item_id, column_percent_id|
      next if self[column_item_id].zero? || self[column_percent_id].zero?
      item = Item.where(:itemid => self[column_item_id]).first
      self.monster_items.create(:item => item, :percent => self[column_percent_id])
    end
  end

  def update_mvp_mobdrops
    #only rebuild if any rewards have been changed
    return unless columns_changed?(@@mvp_drop_columns)
    self.mvp_items.destroy_all
    @@mvp_drop_columns.each do |column_item_id, column_percent_id|
      next if self[column_item_id].zero? || self[column_percent_id].zero?
      item = Item.where(:itemid => self[column_item_id]).first
      self.mvp_items.create(:item => item, :percent => self[column_percent_id])
    end
  end

  def columns_changed?(columns_to_check)
    columns_to_check.each do |a|
      begin
      return true if self.send("#{a.first}_changed?") || self.send("#{a.last}_changed?")
      rescue NoMethodError
        #attribute is unknown, so we can ignore it
      end
    end
    false
  end

end