require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: memberships
#
#  id         :integer         not null, primary key
#  role       :string(255)
#  member_id  :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

