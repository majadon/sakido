# == Schema Information
#
# Table name: monsterskills
#
#  id              :integer          not null, primary key
#  mobid           :integer
#  dummy_value     :string(255)
#  state           :string(255)
#  skill_id        :integer
#  skill_lv        :integer
#  rate            :integer
#  casttime        :integer
#  delay           :integer
#  cancelable      :string(255)
#  target          :string(255)
#  condition_type  :string(255)
#  condition_value :string(255)
#  val1            :integer
#  val2            :integer
#  val3            :integer
#  val4            :integer
#  val5            :integer
#  emotion         :string(255)
#  chat            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class MonsterskillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
