# == Schema Information
#
# Table name: elements
#
#  id              :integer          not null, primary key
#  element_id      :integer
#  monster_element :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class ElementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
