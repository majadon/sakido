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

require 'test_helper'

class MonsterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
