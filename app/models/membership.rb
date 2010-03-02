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

class Membership < ActiveRecord::Base
  belongs_to :member, :class_name => "Person"
  belongs_to :group
end

