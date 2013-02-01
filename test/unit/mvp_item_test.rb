# == Schema Information
#
# Table name: mvp_items
#
#  id         :integer          not null, primary key
#  monster_id :integer
#  item_id    :integer
#  percent    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MvpItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
