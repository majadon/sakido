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

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
