# == Schema Information
#
# Table name: monsters
#
#  id          :integer          not null, primary key
#  mobid       :integer
#  sprite_name :string(255)
#  kroname     :string(255)
#  ironame     :string(255)
#  lv          :integer
#  hp          :integer
#  sp          :integer
#  exp         :integer
#  jexp        :integer
#  range1      :integer
#  atk1        :integer
#  atk2        :integer
#  def         :integer
#  mdef        :integer
#  str         :integer
#  agi         :integer
#  vit         :integer
#  int         :integer
#  dex         :integer
#  luk         :integer
#  range2      :integer
#  range3      :integer
#  scale_id    :integer
#  race_id     :integer
#  element_id  :integer
#  mode        :string(255)
#  speed       :integer
#  adelay      :integer
#  amotion     :integer
#  dmotion     :integer
#  mexp        :integer
#  mvp1id      :integer
#  mvp1per     :integer
#  mvp2id      :integer
#  mvp2per     :integer
#  mvp3id      :integer
#  mvp3per     :integer
#  drop1id     :integer
#  drop1per    :integer
#  drop2id     :integer
#  drop2per    :integer
#  drop3id     :integer
#  drop3per    :integer
#  drop4id     :integer
#  drop4per    :integer
#  drop5id     :integer
#  drop5per    :integer
#  drop6id     :integer
#  drop6per    :integer
#  drop7id     :integer
#  drop7per    :integer
#  drop8id     :integer
#  drop8per    :integer
#  drop9id     :integer
#  drop9per    :integer
#  dropcardid  :integer
#  dropcardper :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Monster < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :mobid, :mob_id

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

  @@spawn_columns = [ :mobid ]  

  after_save :update_mobdrops, :update_mvp_mobdrops

  has_many :monster_items, :dependent => :destroy
  has_many :items, :through => :monster_items

  has_many :mvp_items, :dependent => :destroy
  has_many :items, :through => :mvp_items

  has_many :spawns,
        :foreign_key => :mob_id,
        :primary_key => :mobid,
        :dependent => :destroy
        
  has_many :maps,
        :through => :spawns

  has_many :monsterskills,
        :foreign_key => :mobid,
        :primary_key => :mobid,
        :dependent => :destroy

  belongs_to :scale,
        :primary_key => :scale_id,
        :inverse_of => :monsters

  belongs_to :race,
        :primary_key => :race_id,
        :inverse_of => :monsters

  belongs_to :element,
        :primary_key => :element_id,
        :inverse_of => :monsters

	def to_s
    self.ironame
  end

  def to_param
    "#{self.id}-#{self.to_s.parameterize}"
  end

  def atkrange
    [self.atk1,self.atk2]
  end

  def monster_modes
    modes = []
    self.mode.to_i(16).to_s(2).reverse.split("").each_with_index do |enabled, mode_id|
      modes << mode_id+1 unless enabled.to_i.zero?
    end
    Monstermode.where(:id => modes)
  end

  def monsterspawns
    Spawn.where(:mob_id => mobid)
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
