# == Schema Information
#
# Table name: races
#
#  id           :integer          not null, primary key
#  race_id      :integer
#  monster_race :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class RaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
