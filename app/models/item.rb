# == Schema Information
#
# Table name: items
#
#  id               :integer          not null, primary key
#  itemid           :integer
#  aegisname        :string(255)
#  name             :string(255)
#  modeltype        :integer
#  buy              :integer
#  sell             :integer
#  weight           :integer
#  atk              :integer
#  def              :integer
#  range            :integer
#  slots            :integer
#  job              :string(255)
#  upper            :integer
#  gender           :integer
#  loc              :integer
#  wlv              :integer
#  elv              :integer
#  refineable       :integer
#  view             :integer
#  script           :string(255)
#  onequip_script   :string(255)
#  onunequip_script :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Item < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :itemid

  has_many :monster_items, :dependent => :destroy
  has_many :monsters, :through => :monster_items

  has_many :mvp_items, :dependent => :destroy
  has_many :monsters, :through => :mvp_items

  has_many :item_comments, :dependent => :destroy

    def to_s
      self.name
    end

    def to_param
      "#{self.id}-#{self.to_s.parameterize}"
    end

end
