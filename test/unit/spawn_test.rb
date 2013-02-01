# == Schema Information
#
# Table name: spawns
#
#  id         :integer          not null, primary key
#  map_name   :string(255)
#  x_cord     :integer
#  y_cord     :integer
#  x2_cord    :integer
#  y2_cord    :integer
#  monster    :string(255)
#  name       :string(255)
#  mob_id     :integer
#  amount     :integer
#  delay      :integer
#  variance   :integer
#  event      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SpawnTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
